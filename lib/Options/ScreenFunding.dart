import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:banking_dev_app/Options/ScreenReview.dart';
import 'package:uuid/uuid.dart';
import '../data_model/Model.dart';
import '../db/Api_services.dart';

// Import your API services

// ... (previous imports and code) ...

class ScreenFunding extends StatefulWidget {
  final int id;
  const ScreenFunding({Key? key, required this.id}) : super(key: key);

  @override
  State<ScreenFunding> createState() => _ScreenFundingState();
}

class _ScreenFundingState extends State<ScreenFunding> {
  String dropValue = "";
  TextEditingController _controller = TextEditingController();
  final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  
  UserData? userData;
  @override
  Widget build(BuildContext context) {
      final Uuid uuid = Uuid();
   final String deviceId = uuid.v4();
    return Scaffold(
      appBar: AppBar(
        title: Text("BACK TO DASHBOARD"),
      ),
      body: SafeArea(
        child: FutureBuilder<List<FundData>>(
          future: ApiService()
              .fetchFundData(widget.id), // Call your API function here
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Data is still loading
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              // An error occurred while fetching data
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              // No data available
              return Text('No data available.');
            } else {
              // Data has been successfully fetched
              print(widget.id);

              List<FundData> fundData = snapshot.data!;
              List<List<String>> fundItems =
                  fundData.map((e) => e.items).toList();
              List<String> flattenedItems =
                  fundItems.expand((items) => items).toList();

              print(fundItems);
              return Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "How Much do you want to Transfer to open the account?",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: _controller,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(0),
                        ),
                        hintText: '\$0',
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "How do you want to fund your account?",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      color: Colors.white,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          icon: const Icon(Icons.keyboard_arrow_down),
                          isExpanded: true,
                          value: flattenedItems.isNotEmpty
                              ? flattenedItems[0]
                              : null, // Set a default value if the list is not empty
                          items: flattenedItems.map((String item) {
                            return DropdownMenuItem<String>(
                              value: item,
                              child: Text(item),
                            );
                          }).toList(),
                          onChanged: (value) {
                            // Handle the selection
                            setState(() {
                              dropValue = value!;
                            });
                            print(value);
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.90,
                            height: MediaQuery.of(context).size.height * 0.07,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ScreenReview()));
                                setState(() {
                                  userData = UserData(
                                    id: 1,
                                    deviceId: deviceId,
                                    amount: int.parse(_controller.text),
                                    item: dropValue,
                                  );
                                });
                                var status =
                                    ApiService().insertUserData(userData!);
                                status.then((value) => () {
                                      if(value){
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                          content: Text("Uploaded"),
                                        ));
                                      }else{
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                          content: Text("Error While Updoading"),
                                        ));
                                      }
                                    });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                              ),
                              child: Text(
                                "NEXT",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10), // Space between buttons
                          TextButton(
                            onPressed: () {
                              // Add your onPressed logic here
                            },
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                            ),
                            child: Text(
                              "I'LL FUND MY ACCOUNT LATER",
                              style: TextStyle(
                                color: const Color.fromARGB(255, 0, 0, 0),
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }


  
}
