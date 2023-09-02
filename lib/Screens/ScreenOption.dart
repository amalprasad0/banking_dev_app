import 'package:banking_dev_app/Options/ScreenSelection.dart';
import 'package:banking_dev_app/Widgets/cardButtonWidget.dart';
import 'package:flutter/material.dart';

List features = [
  "No monthly maintenance fee",
  "No minimum balance to open and earn d ividends",
  "Save Automatically with bRound Up ",
];

class ScreenOption extends StatelessWidget {
  ScreenOption({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BACK TO DASHBOARD"),
      ),
      body: ScreenSelection(),
      
      );
  }
}
