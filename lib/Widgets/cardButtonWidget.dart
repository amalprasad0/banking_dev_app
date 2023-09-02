import 'package:flutter/material.dart';
import '../Options/ScreenFunding.dart';
import '../data_model/Model.dart';
import '../db/Api_services.dart';

class cardbutton extends StatelessWidget {
  final int id;
  const cardbutton({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CardData>>(
      future: ApiService().fetchCardData(id), // Fetch card data using ApiService
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          print(snapshot.error);
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No card data available'));
        } else {
          final cardDataList = snapshot.data!;
          return ListView.builder(
            itemCount: cardDataList.length,
            itemBuilder: (BuildContext context, int index) {
              final cardData = cardDataList[index];
              return Container(
                height: 130,
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: GestureDetector(
                  onTap: () { 
                    int id=cardData.id;
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ScreenFunding(id:3,),
                    ),
                  );
                  },
                  child: Card(
                    color: Color.fromARGB(255, 255, 255, 255),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                        color: Colors.grey, // Choose your border color
                        width: 1.0, // Choose your border width
                      ),
                    ),
                    borderOnForeground: true,
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            cardData.title, // Use cardData from the API
                            style: TextStyle(
                              fontSize: 20,
                              color: const Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            cardData.data + " APY", // Use cardData from the API
                            style: TextStyle(
                              fontSize: 35,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
