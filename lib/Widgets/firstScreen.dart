import 'package:flutter/material.dart';

class WidgetFirstScreen extends StatelessWidget {
  const WidgetFirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(child: 
      Container(
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30)
          )
        ),
        child: Column(
          children: [
            Text("hello world")
          ],
        ),
      )
    );
  }
}