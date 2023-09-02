import 'package:flutter/material.dart';
import '../data_model/Model.dart';
import '../db/Api_services.dart';

const tickImg =
    "https://www.freepnglogos.com/uploads/tick-png/image-tick-mark-icon-png-good-luck-charlie-wiki-2.png";

class HomeComponents extends StatelessWidget {
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MyData>>(
      future: apiService.fetchData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          print(snapshot.error);
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Text('No data available');
        } else {
          final dataList = snapshot.data!;
          return ListView.builder(
            itemCount: dataList.length,
            itemBuilder: (BuildContext context, int index) {
              final data = dataList[index];
              return InkWell(
                onTap: () {
                  if (data.screenRoute.isNotEmpty) {
                    Navigator.pushNamed(context, data.screenRoute, arguments: data.id);
                    print(data.id);

                  }
                },
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
                            data.title,
                            style: const TextStyle(
                              fontSize: 23,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 15),
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 7),
                                child: Image.network(
                                  data.imgUrl,
                                  height: 70,
                                  width: 70,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(width: 10),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ContentWidget(
                                      content: data.description[0],
                                      title: data.description[1],
                                    ),
                                    SizedBox(height: 10),
                                    ContentWidget(
                                      content: data.content,
                                      title: data.title,
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
      },
    );
  }
}

class ContentWidget extends StatelessWidget {
  final String content;
  final String title;

  ContentWidget({
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

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('API Data Example'),
      ),
      body: HomeComponents(),
    ),
  ));
}
