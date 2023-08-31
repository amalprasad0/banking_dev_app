import 'package:flutter/material.dart';
import '../Widgets/homeComponents.dart';
import '../Widgets/widget_progress.dart';
import '../Widgets/firstScreen.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text("BACK TO DASHBOARD"),
      ),
      body:SafeArea(
          child:Column(
            children: [
              SizedBox(height: 50),
              HomeComponents(),
            ],
          )
      )
    );
  }
}