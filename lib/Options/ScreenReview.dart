import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScreenReview(),
    );
  }
}

class AccountDetail {
  final String label;
  final String value;

  AccountDetail(this.label, this.value);
}

class ScreenReview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BACK TO DASHBOARD"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              "You're almost done! Simply review the details below before opening your account.",
              style: TextStyle(fontSize: 17),
            ),
            Divider(
              height: 30,
              color: Color.fromARGB(255, 79, 85, 79),
              thickness: 1,
            ),
            Text(
              "ACCOUNT DETAILS",
              style: TextStyle(fontSize: 17, color: Colors.grey),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: Data.length,
                itemBuilder: (context, index) {
                  final detail = Data[index];
                  return AccountDetailItem(
                    label: detail["Account Type"]!,
                    value: detail["APY"]!,
                    minValue: detail["Minimum Balance"]!,
                    feeValue: detail["Monthly Fee"]!,
                    depositValue: detail["Minimum Deposit"]!,
                  );
                },
              ),
            ),
            AccountAcknowledgeItem(
              text: "I acknowledge that this is an individual application and not a joint account.",
            ),
            AccountAcknowledgeItem(
              text: "I acknowledge that this is an ndividual application and not a joint account.",
            ),
            SizedBox(height: 20),
            Container(
                      width: MediaQuery.of(context).size.width * 0.90,
                      height: MediaQuery.of(context).size.height *
                          0.07, // 7% of the screen height
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context,MaterialPageRoute(builder: (context) => ScreenReview()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:Color(0xFF25323D),
                          
                        ),
                        child: Text("OPEN ACCOUNT",style: TextStyle(
                          fontSize: 20,
                        ),),
                      ),
                    ),
          ],
        ),
      ),
    );
  }
}

class AccountDetailItem extends StatelessWidget {
  final String label;
  final String value;
  final String minValue;
  final String feeValue;
  final String depositValue;

  AccountDetailItem({
    required this.label,
    required this.value,
    required this.minValue,
    required this.feeValue,
    required this.depositValue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AccountDetailRow("Account Type", label),
          Divider(
            height: 10,
            color: Color.fromARGB(255, 79, 85, 79),
            thickness: 1,
          ),
          AccountDetailRow("APY", value),
          Divider(
            height: 10,
            color: Color.fromARGB(255, 79, 85, 79),
            thickness: 1,
          ),
          AccountDetailRow("Minimum Balance", minValue),
          Divider(
            height: 10,
            color: Color.fromARGB(255, 79, 85, 79),
            thickness: 1,
          ),
          AccountDetailRow("Monthly Fee", feeValue),
          Divider(
            height: 10,
            color: Color.fromARGB(255, 79, 85, 79),
            thickness: 1,
          ),
          AccountDetailRow("Minimum Deposit", depositValue),
        ],
      ),
    );
  }
}

class AccountDetailRow extends StatelessWidget {
  final String label;
  final String value;

  AccountDetailRow(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 17, color: Colors.grey),
          ),
          SizedBox(width: 120),
          Text(
            value,
            style: TextStyle(fontSize: 17, color: Colors.black),
          ),
        ],
      ),
    );
  }
}

class AccountAcknowledgeItem extends StatelessWidget {
  final String text;

  AccountAcknowledgeItem({required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Checkbox(
          value: false,
          onChanged: (value) {},
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 17,
                color: Color.fromARGB(255, 0, 0, 0),
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
          ),
        ),
        Icon(
          Icons.info_rounded,
          size: 20,
          color: Color.fromARGB(255, 0, 0, 0),
        )
      ],
    );
  }
}

List<Map<String, String>> Data = [
  {
    "Account Type": "Basic Checking",
    "APY": "2.12%",
    "Minimum Balance": "\$0.00",
    "Monthly Fee": "\$0.00",
    "Minimum Deposit": "\$0.00",
  },
  // Add more account data here
];
