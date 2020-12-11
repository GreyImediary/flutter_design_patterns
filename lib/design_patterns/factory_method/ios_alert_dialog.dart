import 'package:flutter/cupertino.dart';
import 'package:flutter_design_patterns/design_patterns/factory_method/custom_dialog.dart';

class IosAlertDialog extends CustomDialog {
  @override
  String getTitle() {
    return 'Ios alert dialog';
  }

  @override
  Widget create(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(getTitle()),
      content: Text('This is the cupertino-style dialog'),
      actions: [
        CupertinoButton(
          child: Text('Dismiss'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}
