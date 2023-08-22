import 'package:flutter/material.dart';


List gfg = [
{
  "id":1,
  "img_url":"https://media.geeksforgeeks.org/wp-content/uploads/20210719182709/Untitled-design-1.png",
  "title":"Chcekings Account",
},
{
  "id":2,
  "img_url":"https://media.geeksforgeeks.org/wp-content/uploads/20210719182709/Untitled-design-1.png",
  "title":"Chcekings Account",
},
{
  "id":3,
  "img_url":"https://media.geeksforgeeks.org/wp-content/uploads/20210719182709/Untitled-design-1.png",
  "title":"Chcekings Account",
},
{
  "id":3,
  "img_url":"https://media.geeksforgeeks.org/wp-content/uploads/20210719182709/Untitled-design-1.png",
  "title":"Chcekings Account",
}
];


class HomeComponents extends StatelessWidget {
  const HomeComponents({Key? key}) : super(key: key);  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: gfg.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 150,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(1),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 29, 26, 26),
            borderRadius: BorderRadius.circular(10)
          ),
          
          child: Card(
            child: Row(
              children: [
                Text(gfg[index]["title"])
              ],
            ),
          ),
        );
      },
    );
  }
}