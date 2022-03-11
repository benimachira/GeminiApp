import 'dart:convert';
import 'dart:io';
import 'package:gemini_app/screens/database_helper.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'dart:convert';

import '../models/survey_models/survey_answer.dart';
import '../models/survey_models/survey_cat_question.dart';
import '../models/survey_models/survey_questions.dart';

String TOKEN =
    'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiZDUzZWI2NWYxZGNiNTQ1NDRlZjVhZGM1M2QzY2U1OWY5YWQ3MzUzODZjMjg0MzI5OTc2ZDE5YThjZjEyNWIwNGRiYTk4ZDM3NGQ0ZTQ3YTUiLCJpYXQiOjE2NDY3MzgwODcuMjA4MTU4LCJuYmYiOjE2NDY3MzgwODcuMjA4MTYsImV4cCI6MTY3ODI3NDA4Ny4yMDA0ODMsInN1YiI6IjEiLCJzY29wZXMiOltdfQ.GwOg8nRQwhV0psIXo1aNg0rPbTCqNHlO3TZ49gIlpt5JPCCP3IkCQhtrBTJY4xxava9lEZKhkBk6QRvbtZy7kKA_wRqlBAv2NlWDF6hNbG6VzKZ-FwkOkWep25nzH5NMQ7CtNN9RtEahCNpIdwmtnhtOFjMbgPUEt56pvXSCAaqYtySy7P7qlvFA9fYyYspYSFFkf382XK2xvhBEaaCWdzL6SNrieb9xJPivKN1kSlQ2ExAuV4isnen6N2UIzQR0CGZnNaiDZR2OIas9MrY5yINWxFQDyJ_pNjfxolMw0VfmZuUyDUBtkF4sWKzFeeCkZNb_ogC-KYLfMRWCrRL1T6yw-UVPEhdtYH8KrAAaLlTirwzbOArWvuhjqEgHy2q3f_PW8j_10aQMGTzQEnOFaS_ZnK0ilA0wvc0UsqMWSVp616Kg3kM1m-32OnQCWYQDBEvywRKnQZM_A3ygSEuh59nLEt9cYgm5P1mUiLmmxAK75O9_bIgvNs068sK2lQ1K8ups2cWnOQ5lOuPsW62xLEeR2eR7UCEUUSTkKKKC6zl_D1uswgd4IwMJq8IYX3j9VSJEt2Vvz6awMj4h2RSGp66WTw_aFCK9RF8QjV3fRFkHVauFaYNnGhYMhuFDjPjatrhCueztfEZcKUCqONYECJoCtKrice1kk-DEmhJ8Tdo';

class UserService {
  DatabaseHelper db = DatabaseHelper.instance;
  var http;

  UserService() {
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    http = new IOClient(ioc);

    // client.badCertificateCallback = ((X509Certificate cert, String host, int port) => true);
  }

  HttpClient client = new HttpClient();

  Future<String> user_login(String login_detail, String password) async {
    Map<String, String> requestbody = {
      'login_detail': '${login_detail}',
      'password': '${password}'
    };

    final response = await http.post(
        Uri.parse('https://mtoffice.dyndns.org:8000/api/user/login'),
        body: requestbody);
    String result;
    String res = 'NO';

    try {
      if (response.statusCode == 200) {
        var x = json.decode(response.body);
        print(x);
        if (x['success'] == 1) {
          result = x['access_token'];
          String uid = parseJwt(result)['sub'];
          String role = x['role'];

          print(role);

          int verify = x['is_verify'];

          await db.add_auth_token(result, uid, role, verify);
          res='YES';
        }
      } else {
        print(response.statusCode);
      }
    } on Exception catch (e) {
      print(e);
    }

    return res;
  }

  Future<String> load_profile(String token, uid) async {
    Map<String, String> requestbody = {'uid': '${uid}'};

    Map<String, String> headers = {
      'Authorization': 'Bearer $token',
    };

    final response = await http.post(
        Uri.parse('https://mtoffice.dyndns.org:8000/api/currentuserdata'),
        headers: headers,
        body: requestbody);
    String result;

    try {
      if (response.statusCode == 200) {
        var x = json.decode(response.body);
        if (x['success'] == 1) {
          print(x['data']);
        }
      } else {
        print(response.statusCode);
      }
    } on Exception catch (e) {
      // TODO
      print(e);
    }

    return result;
  }

  Future<List<ModelSurveyQuestions>> load_survey() async {
    Map<String, String> requestbody = {'role': 'retailer'};

    Map<String, String> headers = {
      'Authorization': 'Bearer $TOKEN',
    };

    final response = await http.post(
        Uri.parse('https://mtoffice.dyndns.org:8000/api/survey/question/view'),
        headers: headers,
        body: requestbody);
    List result;

    List<ModelSurveyQuestions> rela = [];

    try {
      if (response.statusCode == 200) {
        var x = json.decode(response.body);

        if (x['success'] == 1) {
          print('element');
          result = x['data'];
          result.forEach((element) {
            ModelSurveyQuestions modelSurveyQuestions =
                ModelSurveyQuestions.from(element);
            rela.add(modelSurveyQuestions);
          });

          print(result);
        }
      } else {
        print(response.statusCode);
      }
    } on Exception catch (e) {
      // TODO
      print(e);
    }

    return rela;
  }

  Future<ModelSurveyAnswers> select_quiz(survey, id) async {
    Map<String, String> requestbody = {
      'survey_id': '${survey}',
      'question_id': '${id}'
    };

    Map<String, String> headers = {
      'Authorization': 'Bearer $TOKEN',
    };

    final response = await http.post(
        Uri.parse(
            'https://mtoffice.dyndns.org:8000/api/survey/view-by-question'),
        headers: headers,
        body: requestbody);

    ModelSurveyAnswers rela;

    try {
      var x = json.decode(response.body);

      if (x['success'] == 1) {
        Map data = x['data'];

        rela = ModelSurveyAnswers.from(data);
      }
      {
        print('x');
      }
    } on Exception catch (e) {
      // TODO
      print(e);
    }

    print(rela.id);

    return rela;
  }

  Future<Map<String, dynamic>> create_survey(requestbody) async {
    // var tok ='eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYzNjOWMzZTAzMzk2MzU1Yjk3MTM1ZDAxMmY0YmZkYWQwMGIzNzM2ZjkzYWIxYTc4N2EwZDRkZjJmZWE0NmIyN2E1NzNjMDFjZjRjZjQ1MTEiLCJpYXQiOjE2NDYxMjAzOTEuNDQ2MTc1LCJuYmYiOjE2NDYxMjAzOTEuNDQ2MTc2LCJleHAiOjE2Nzc2NTYzOTEuNDQwODc4LCJzdWIiOiIzIiwic2NvcGVzIjpbXX0.v8gfYsRCGJEC3rjNc5Sr72nLImcFnOSnfZn9vvqsxOuDxI8zAOSnzva55NzqEfiC25iq6voDd_t1kThrtwJshWjQtRYSbMD6Gn3CIO92gglNbyai4gp2ew_Fjb2SFMIOd2NjiDRQ4SmorIZKXeC2vn4B5U061azBCrAJOygxXCAjZeLkHKwtDQ7BokLKRO2IwVdUvYdwLLL0xL9UtH-KumFpxGO1RweDyueTwPPBk5U_1OmO1zWEQ5ahTRjRilYZG0Kum5oKwllglgmV6E4EuURv0iIbxuYYnRZ6zr9GGCk_i1Kvg7qr5nrObOEheJZId-PjS0NOJVinkb90gZZtx0q26hkS3CZbs21va0rYKu30Cw4FSz9GEi3yRf4qImifNOA1UqSnTv6XuCSmVAhom1lhzozboIf2ouf7_2NIfXKHFzktdhBCbCoFQI5y5lfKLwQpFTWfP96aZeV_hiHBiFw48CFKp4e0zjDLJGG_bqSohUzbHw_76EfGd430z6HFl9Di6Xb87uY9CkisojhVn0uYsMCBTfK6SPoxXaoalhQJhVgjqUIspTVbSH31ouijjtbBulvuyk-oNeHMjsJdq--Uvy7RXrzgl3REl8tdJaXvZe56jG3J8LY5EmCkujBR_46dCOal2mLP5QRpwAbF0JqSg52Viq5RjJ_6VA6cqMg';
    Map<String, String> headers = {
      'Authorization': 'Bearer $TOKEN',
    };

    final response = await http.post(
        Uri.parse('https://mtoffice.dyndns.org:8000/api/survey/create'),
        headers: headers,
        body: requestbody);

    Map<String, dynamic> res = {};

    print('We good${json.decode(response.body)}');
    try {
      var x = json.decode(response.body);
      if (x['success'] == 1) {
        res.addAll({'id': 1, 'res': x['data']['id']});
      }
    } on Exception catch (e) {
      print(e.toString());
    }

    return res;
  }

  Future<int> submit_survey_question(requestbody) async {
    Map<String, String> headers = {
      'Authorization': 'Bearer $TOKEN',
    };

    final response = await http.post(
        Uri.parse(
            'https://mtoffice.dyndns.org:8000/api/survey/question-answer'),
        headers: headers,
        body: requestbody);

    int result = 0;

    try {
      var x = json.decode(response.body);
      print('We good ${x['success']}');
      if (x['success'] == 1) {
        result = 1;
      }
    } on Exception catch (e) {
      // TODO
      print(e);
    }

    return result;
  }

  Future<int> complete_survey(requestbody) async {
    Map<String, String> headers = {
      'Authorization': 'Bearer $TOKEN',
    };

    print(requestbody);

    final response = await http.post(
        Uri.parse(
            'https://mtoffice.dyndns.org:8000/api/survey/update'),
        headers: headers,
        body: requestbody);

    int result = 0;

    try {
      var x = json.decode(response.body);
      print('We good ${x['success']}');
      if (x['success'] == 1) {
        result = 1;
      }
    } on Exception catch (e) {
      // TODO
      print(e);
    }

    return result;
  }

  Future<int> _get_string() async {
    List<Map> list = await db.get_user();
   int id = 0;
    list.forEach((element) {
      id = element['uid'];
    });

    return id;
  }

  Future<List<ModelSurveyCatQuestions>> load_my_survey() async {


    print('here');
    dynamic id = await _get_string();
    Map<String, String> requestbody = {'researcher_id': '${id}'};

    print('${id}');

    Map<String, String> headers = {
      'Authorization': 'Bearer $TOKEN',
    };

    final response = await http.post(
        Uri.parse('https://mtoffice.dyndns.org:8000/api/survey/by-researcher'),
        headers: headers,
        body: requestbody);
    List result;

    List<ModelSurveyCatQuestions> rela = [];

    try {
      if (response.statusCode == 200) {
        var x = json.decode(response.body);

        if (x['success'] == 1) {
          // print('result');
          result = x['result'];
          result.forEach((element) {
            ModelSurveyCatQuestions modelSurveyQuestions =
                ModelSurveyCatQuestions(element);
            rela.add(modelSurveyQuestions);
          });

          print(result);
        }
      } else {
        print(response.statusCode);
      }
    } on Exception catch (e) {
      // TODO
      print(e);
    }

    return rela;
  }





  Map<String, dynamic> parseJwt(String token) {
    final parts = token.split('.');
    if (parts.length != 3) {
      throw Exception('invalid token');
    }

    final payload = _decodeBase64(parts[1]);
    final payloadMap = json.decode(payload);
    if (payloadMap is! Map<String, dynamic>) {
      throw Exception('invalid payload');
    }

    return payloadMap;
  }

  String _decodeBase64(String str) {
    String output = str.replaceAll('-', '+').replaceAll('_', '/');

    switch (output.length % 4) {
      case 0:
        break;
      case 2:
        output += '==';
        break;
      case 3:
        output += '=';
        break;
      default:
        throw Exception('Illegal base64url string!"');
    }

    return utf8.decode(base64Url.decode(output));
  }
}
