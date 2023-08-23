import 'package:flutter/material.dart';

List gfg = [
  {
    "id": 1,
    "img_url":
        "https://t26static.adp.cdp-cdn.com/tiles/270728BE-7284-49DB-8E49-064E8A78359F/1.2/credit-card.png",
    "title": "Checking Account",
    "content1": "Earn a great rate and Enjoy Extended teller hours",
    "title4": "Checkings Account Tit4",
  },
  {
    "id": 2,
    "img_url":
        "https://t26static.adp.cdp-cdn.com/tiles/270728BE-7284-49DB-8E49-064E8A78359F/1.2/piggybank.png",
    "title": "Savings Account",
    "content1": "Earn a great rate and Enjoy Extended teller hours",
    "title1": "Savings Account Title!",
  },
  {
    "id": 3,
    "img_url":
        "https://t26static.adp.cdp-cdn.com/tiles/270728BE-7284-49DB-8E49-064E8A78359F/1.2/certificate.png",
    "title": "Certificate of Deposit",
    "content1": "Earn a great rate and Enjoy Extended teller hours",
    "title1": "Certificate Title",
  },
];
const tickImg =
    "https://www.freepnglogos.com/uploads/tick-png/image-tick-mark-icon-png-good-luck-charlie-wiki-2.png";


class HomeComponents extends StatelessWidget {
  const HomeComponents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: gfg.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () => print("card pressed $index"),
          child: Container( 
            height: 200,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Card(
              color: Color(0xFF25323D),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(13.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      gfg[index]["title"],
                      style: const TextStyle(
                        fontSize: 23,
                        color: Colors.white,
                      ),
                    ),
                   const  SizedBox(height: 15),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 7),
                          child: Image.network(
                            
                            gfg[index]["img_url"],
                            height: 70,
                            width: 70,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Padding(
                          padding: const EdgeInsets.only(left:10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ContentWidget(
                                content: gfg[index]["content1"],
                                title: gfg[index]["title1"],
                              ),
                              const  SizedBox(height: 10),
                              ContentWidget(
                                content: gfg[index]["content1"],
                                title: gfg[index]["title1"],
                              ),
                            ],
                          ),
                        ),
                      ],
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
}

class ContentWidget extends StatelessWidget {
  final String content;
  final String title;

  const ContentWidget({
    required this.content,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Image.network(
                  tickImg,
                  height: 20,
                  width: 20,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 10),
              Column(
                children: [
                  Container(
                    width: 240,
                    child: Text(
                      content,
                      maxLines: 3,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}


