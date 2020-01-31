import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';

class Listview extends StatelessWidget {

  final List<Map> menu = [
    {
      "name": "เบอร์เกอร์ฮัท",
      "type": "คัดสรรวัตถุดิบอย่างดีเพื่อคุณ เบอร์เกอร์ชิ้นใหญ่ กำลังพอดีทานคู่กับเฟรนช์ฟรายส์อิ่มกำลังดี  ",
      "logoText":
          "https://firebasestorage.googleapis.com/v0/b/foodmanage-e63a1.appspot.com/o/OYH6PQ0.jpg?alt=media&token=844dfac4-0405-4e1e-838c-110dcb3e5ebc"
    },
    {
      "name": "ขาไก่ทอด",
      "type": "ขาไก่นุ่มๆ กับแป้งกรอบๆ และเฟรนฟราย คัดสรรวัตถุดิบที่สดใหม่ทุกวันเพื่อคุณ",
      "logoText":
          "https://firebasestorage.googleapis.com/v0/b/foodmanage-e63a1.appspot.com/o/2462.jpg?alt=media&token=ec4c343e-4680-4441-825c-7e26a9e0c1ce"
    },
    {
      "name": "Kinder Garden",
      "location": "572 Statan NY, 12483",
      "type": "Play Group School",
      "logoText":
          "https://cdn.pixabay.com/photo/2016/06/09/18/36/logo-1446293_960_720.png"
    },
    {
      "name": "WilingTon Cambridge",
      "location": "Kasai Pantan NY, 12483",
      "type": "Lower Secondary School",
      "logoText":
          "https://cdn.pixabay.com/photo/2017/01/13/01/22/rocket-1976107_960_720.png"
    },
    {
      "name": "Fredik Panlon",
      "location": "572 Statan NY, 12483",
      "type": "Higher Secondary School",
      "logoText":
          "https://cdn.pixabay.com/photo/2017/03/16/21/18/logo-2150297_960_720.png"
    },
    {
      "name": "Whitehouse International",
      "location": "234 Road Kathmandu, Nepal",
      "type": "Higher Secondary School",
      "logoText":
          "https://cdn.pixabay.com/photo/2017/01/31/13/14/animal-2023924_960_720.png"
    },
    {
      "name": "Haward Play",
      "location": "572 Statan NY, 12483",
      "type": "Play Group School",
      "logoText":
          "https://cdn.pixabay.com/photo/2016/06/09/18/36/logo-1446293_960_720.png"
    },
    {
      "name": "Campare Handeson",
      "location": "Kasai Pantan NY, 12483",
      "type": "Lower Secondary School",
      "logoText":
          "https://cdn.pixabay.com/photo/2017/01/13/01/22/rocket-1976107_960_720.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
        padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
        height: MediaQuery.of(context).size.height * 0.35,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
            itemCount: menu.length, itemBuilder: (context, index) {
              return Container(
                width: MediaQuery.of(context).size.width * 0.6,
                // child:Flexible(
                child: Card(
                  color: Colors.white,
                  child: Container( child: Column (
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          Container(
            // width: 100%,
            height: MediaQuery.of(context).size.height * 0.17,
            decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),

              image: DecorationImage(
                  image: CachedNetworkImageProvider(menu[index]['logoText']),
                  fit: BoxFit.cover 
                  ),
            ),
          )

         ,

          Expanded(
            // width: 200,
            
            child: Column(
              
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
      menu[index]['name'],
      // textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: "Anakotmai",
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Color(0xff000000),
        
        
      ),
    ),
                SizedBox(
                  height: 2,
                ),
          
                    Text(
      menu[index]['type'],
      
      style: TextStyle(
        fontFamily: "Anakotmai",
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: Color(0xff000000).withOpacity(0.5),

      ),
    ),

              ],
            ),

          ),
        ],
      ),
                  ),
                ),
              // ),
              );
        }
        ),
        ),
    );
  }
}