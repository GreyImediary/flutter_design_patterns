import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

abstract class CustomDialog {
  String getTitle();

  Widget create(BuildContext context);

  Future<void> show(BuildContext context) {
    final dialog = create(context);

    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext _) {
        return dialog;
      }
    );
  }
}
