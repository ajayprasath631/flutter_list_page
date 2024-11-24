// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:

class CustomSnackBar {
  static final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

/*Show message in snackbar default*/
  void snackMessage({required String msg}) {
    final snackBar = SnackBar(
      content: Text(msg),
      duration: const Duration(seconds: 1),
    );
    rootScaffoldMessengerKey.currentState
      ?..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  /*Show message in snackbar with GREEN background*/
  void snackPositiveMessage({required String msg}) {
    final snackBar = SnackBar(
      backgroundColor: Colors.green,
      content: Text(msg),
      duration: const Duration(seconds: 1),
    );
    rootScaffoldMessengerKey.currentState
      ?..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  /*Show message in snackbar with RED background*/
  void snackNegativeMessage({
    required String msg,
    required BuildContext context,
    required bool isError,
  }) {
    final snackBar = SnackBar(
      backgroundColor: Colors.red,
      content: Text(msg),
      duration: const Duration(seconds: 3),
    );
    rootScaffoldMessengerKey.currentState
      ?..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  void showSnackbar({
    required String msg,
    required BuildContext context,
    required bool isError,
  }) {
    final snackBar = SnackBar(
      backgroundColor: isError ? Colors.red : Colors.green,
      content: Row(
        children: [
          Icon(
            isError == true ? Icons.error : Icons.check_circle,
            color: Colors.white,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(msg),
          ),
        ],
      ),
      duration: const Duration(seconds: 3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      behavior: SnackBarBehavior.floating,
    );
    rootScaffoldMessengerKey.currentState
      ?..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
