import 'package:clean_arch_demo/core/utils/app_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Constants {
  static void showErrorDialog(
      {required BuildContext buildContext, required String errorMessage}) {
    showDialog(
        context: buildContext,
        builder: (context) => CupertinoAlertDialog(
              title: Text(
                errorMessage,
                style: const TextStyle(color: Colors.black, fontSize: 16),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                    textStyle: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  child: const Text(AppStrings.ok),
                )
              ],
            ));
  }

  static void showToast(
      {required String message,
      required ToastType type,
      ToastGravity? gravity}) {
    Fluttertoast.showToast(
        toastLength: Toast.LENGTH_LONG,
        msg: message,
        gravity: gravity ?? ToastGravity.BOTTOM,
        backgroundColor: getColorToast(type));
  }
}

Color getColorToast(ToastType type) {
  switch (type) {
    case ToastType.ERROR:
      return Colors.red;
    case ToastType.WARING:
      return Colors.yellow;
    default:
      return Colors.green;
  }
}

enum ToastType { ERROR, SUCCESS, WARING }
