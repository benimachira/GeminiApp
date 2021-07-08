import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

import 'custom_color.dart';

class UniversalMethods {
  static const color_purple = '#0f305e';
  static const color_orange = '#D60812';

  static String get_current_date() {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd kk:mm').format(now);
    return formattedDate;
  }

  showLoaderDialog(BuildContext context, String message) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(
              margin: EdgeInsets.only(left: 7), child: Text("${message}...")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static void show_toast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        fontSize: 13.0);
  }

  static String sanitize_null_strings(String s) {
    if (s == null) {
      return "";
    } else {
      return s;
    }
  }

  static String convert_phone_number(String s) {
    if (s.isNotEmpty) {
      if (s.length != 10) {
        return "E";
      } else {
        int numSpace = 1;
        String result = s.replaceRange(0, numSpace, '+254');
        return result;
      }
    } else {
      return "E";
    }
  }

  static List<String> getMonthsInYear(DateTime userCreatedDate) {
    DateFormat dateFormat = DateFormat("yyyy-MM-dd");
    final dates = <String>[];
    final now = DateTime.now();
    final sixMonthFromNow = DateTime(now.year, now.month + 6);
    DateTime date = userCreatedDate;

    while (date.isBefore(sixMonthFromNow)) {
      dates.add(dateFormat.format(date));
      date = DateTime(date.year, date.month + 1);
    }
    return dates;
  }
}
