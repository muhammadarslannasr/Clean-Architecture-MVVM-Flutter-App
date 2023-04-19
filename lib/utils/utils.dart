import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {

  static double averageRating(List<int> rating){
    var avgRating = 0;
    for(int i=0; i< rating.length; i++){
      avgRating = avgRating + rating[i];
    }

    return double.parse((avgRating/rating.length).toStringAsFixed(2));
  }

  static void fieldFocusChange({
    required BuildContext context,
    required FocusNode current,
    required FocusNode nextFocus,
  }) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static toastMessage({required String message}) {
    Fluttertoast.showToast(msg: message);
  }

  static void flushBarErrorMessage(
      {required String message, required BuildContext context}) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          forwardAnimationCurve: Curves.decelerate,
          flushbarPosition: FlushbarPosition.TOP,
          message: message,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          padding: const EdgeInsets.all(15),
          duration: const Duration(seconds: 3),
          backgroundColor: Colors.red,
          reverseAnimationCurve: Curves.easeInOut,
          borderRadius: BorderRadius.circular(8),
          positionOffset: 20,
          icon: const Icon(
            Icons.error,
            size: 28,
            color: Colors.white,
          ),
        )..show(context));
  }

  static snackBar({required String message, required BuildContext context}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(
          message,
        ),
      ),
    );
  }
}
