import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_design_patterns/constants.dart';
import 'package:flutter_design_patterns/design_patterns/factory_method/android_alert_dialog.dart';
import 'package:flutter_design_patterns/design_patterns/factory_method/custom_dialog.dart';
import 'package:flutter_design_patterns/design_patterns/factory_method/ios_alert_dialog.dart';
import 'package:flutter_design_patterns/widgets/factory_method/dialog_selection.dart';

class FactoryMethod extends StatefulWidget {
  @override
  _FactoryMethodState createState() => _FactoryMethodState();
}

class _FactoryMethodState extends State<FactoryMethod> {
  final List<CustomDialog> customDialogs = [
    AndroidAlertDialog(),
    IosAlertDialog()
  ];

  int _selectedDialogIndex = 0;

  Future _showCustomDialog(BuildContext context) async {
    var selectedDialog = customDialogs[_selectedDialogIndex];

    return selectedDialog.show(context);
  }

  void _setSelectedDialogIndex(int index) {
    setState(() {
      _selectedDialogIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollBehavior(),
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: paddingL),
        child: Column(
          children: [
            DialogSelection(
              customDialogList: customDialogs,
              selectedIndex: _selectedDialogIndex,
              onChanged: _setSelectedDialogIndex,
            ),
            const SizedBox(
              height: spaceL,
            ),
            MaterialButton(
              child: Text('show dialog'),
              color: Colors.black87,
              textColor: Colors.white,
              onPressed: () => _showCustomDialog(context),
            )
          ],
        ),
      ),
    );
  }
}
