import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider_test/utils/colors.dart';

class Utils {
  static toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: green,
        textColor: white0,
        fontSize: 16.0);
  }

  static flushbar(String? title, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          title: title ?? "",
          message: "",
          backgroundColor: black0,
          titleSize: 18,
          messageSize: 0,
          duration: const Duration(seconds: 3),
        )..show(context));
  }

  static Widget loadingCircle() {
    return Positioned(
      child: Container(
        color: white1.withOpacity(0.7),
        child: const Center(
          child: CircularProgressIndicator(
            color: black0,
          ),
        ),
      ),
    );
  }
}
