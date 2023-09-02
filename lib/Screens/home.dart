import 'package:flutter/material.dart';
import '../Widgets/homeComponents.dart';
import 'package:url_launcher/url_launcher.dart';

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
              Expanded(child: HomeComponents()),
            ],
          )
      )
    );
  }
}