import 'package:flutter/material.dart';
import 'package:gitstaredrepogetter/app.dart';
import 'package:gitstaredrepogetter/core/enums/enums.dart';

class Toaster {
  static const int _snackDurationSecond = 2;
  static const String _defaultErrorTitle = "Error";
  static const String _defaultErrorMessage = "Some error occurred.";


  static String _getDefaultText(
      {bool isTitle = true}) {
    var massage = '';
    var title = '';
    title = _defaultErrorTitle;
    massage = _defaultErrorMessage;
    return isTitle ? title : massage;
  }

  static Widget _buildTitleMassage(
      String title, String message, ToasterType toasterType) {
    var defaultMassage = _getDefaultText(isTitle: false);
    var defaultTitle = _getDefaultText(isTitle: true);
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title == "" ? defaultTitle : title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              fontSize: 16,
            ),
          ),
          Text(
            message == "" ? defaultMassage : message,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w300,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  static void showError(String message, {String title = ""}) {
    hideAll();
    SnackBar snackBar = SnackBar(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      backgroundColor: Colors.red,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
            child: Icon(
              Icons.error_rounded,
              color: Colors.white,
            ),
          ),
          _buildTitleMassage(title, message, ToasterType.error),
        ],
      ),
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      duration: const Duration(seconds: _snackDurationSecond),
    );
    rootScaffoldMessengerKey.currentState?.showSnackBar(snackBar);
  }

  static void hideAll() {
    rootScaffoldMessengerKey.currentState?.clearSnackBars();
  }
}
