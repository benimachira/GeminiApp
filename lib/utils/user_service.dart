import 'dart:convert';
import 'package:gemini_app/screens/database_helper.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserService {
  DatabaseHelper db = DatabaseHelper.instance;

  Future<String> user_login(String login_detail,String password) async {
    Map<String, String> requestbody = {
      'login_detail': '${login_detail}',
      'password': '${password}'
    };

    final response = await http.post(
        Uri.parse(
            'http://mtoffice.dyndns.org:8000/api/user/login'),body: requestbody
        );
    String  result ;
    String  res= 'NO' ;

    try {
      if (response.statusCode == 200) {
        var x = json.decode(response.body);
        if (x['success'] ==1) {
          //print(x['data']);
          res='YES';
          result = x['access_token'];
           print(parseJwt(result));
          String role= x['role'];
           String uid= parseJwt(result)['sub'];
          db.add_auth_token(result,uid,role);

        }
      } else {
        print(response.statusCode);
      }
    } on Exception catch (e) {
      print(e);
    }

    return res;
  }


  Future<String> load_profile(String token,uid) async {
    Map<String, String> requestbody = {
      'uid': '${uid}'
    };

    Map<String, String> headers = {
      'Authorization': 'Bearer $token',
    };

    final response = await http.post(
        Uri.parse(
            'http://mtoffice.dyndns.org:8000/api/currentuserdata'),headers: headers,body: requestbody
    );
    String  result ;

    try {
      if (response.statusCode == 200) {
        var x = json.decode(response.body);
        if (x['success'] ==1) {
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