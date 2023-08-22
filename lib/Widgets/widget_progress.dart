import 'package:banking_dev_app/Widgets/widget_stepper.dart';
import 'package:flutter/material.dart';

class WidgetProgressStepper extends StatelessWidget {
  const WidgetProgressStepper({Key? key}) : super(key: key); // Corrected constructor syntax

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top:14.0),
          child: Column(
            children: [
               Text("SELECT CHECKING ACCOUNT",
                  style: TextStyle(
                    fontSize: 17.5,  
                  )
                ),
              WidgetStepper(),
              
            ],
          ),
        ),
      ],
    );
  }
}
