import 'package:flutter/material.dart';
import '../Widgets/cardButtonWidget.dart';

List features = [
  "No monthly maintenance fee",
  "No minimum balance to open and earn d ividends",
  "Save Automatically with bRound Up ",
];
class ScreenSelection extends StatelessWidget {
  const ScreenSelection({super.key});


  @override
  Widget build(BuildContext context) {
  final int? id = ModalRoute.of(context)!.settings.arguments as int?;
  final int Id = id ?? 0;
  print("passed-id:$Id");

    return SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Saving account features",
                  style: TextStyle(
                    fontSize: 20,
                  )),
              Container(
                  height: 110,
                  // margin: EdgeInsets.all(20),
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Row(children: [
                        Text(
                          "\u2022",
                          style: TextStyle(fontSize: 30),
                        ), //bullet text
                        SizedBox(
                          width: 7,
                        ), //space between bullet and text
                        Expanded(
                          child: Text(
                            features[index],
                            style: TextStyle(fontSize: 17),
                          ), //text
                        )
                      ]);
                    },
                    itemCount: features.length,
                  )),
              // InkWell(
              //   child: const Text(
              //     'Compare Savings Accoun options',
              //     style: TextStyle(
              //       fontSize: 17,
              //       color: Colors.blue,
              //       decoration: TextDecoration.underline,
              //     ),
              //   ),
              // ),
              Row(children: [
                InkWell(
                child: const Text(
                  'Compare Savings Account options',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              SizedBox(width: 10,),
              Icon(Icons.exit_to_app_outlined,size: 20,color: Colors.blue,)
              ],),
               Divider(
              height: 30,
              color: Color.fromARGB(255, 79, 85, 79),
              thickness: 2,
              indent: 20,
              endIndent: 20,
               
            ),
            Text("Which savings Would you like to open?",
                  style: TextStyle(
                    fontSize: 17,
                  )),
              Expanded(child: cardbutton(id:Id,)),
              Text("Note: APY means Annual Percentage Yield. APY is accurate as of the last dividend declaration date.There is a limit of one Go Green Checking account and one Go Green Money Market account per Social Security Number. Must have a Go Green Checking account to qualify for a Go Green Money Market.")
            ],
          ),
        ),
      ) ;
  }
}