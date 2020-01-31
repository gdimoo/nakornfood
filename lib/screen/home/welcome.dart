// import 'package:arfood/screen/home/cart.dart';
// import 'package:arfood/screen/home/menu.dart';
import 'package:arfood/screen/home/listview.dart';
import 'package:arfood/screen/home/menu.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

final List<String> imgList = [
  'https://firebasestorage.googleapis.com/v0/b/foodmanage-e63a1.appspot.com/o/promo1.png?alt=media&token=0fb0327e-7de2-40a4-b737-d710f9843cf9',
  'https://firebasestorage.googleapis.com/v0/b/foodmanage-e63a1.appspot.com/o/promo1.png?alt=media&token=0fb0327e-7de2-40a4-b737-d710f9843cf9',
  'https://firebasestorage.googleapis.com/v0/b/foodmanage-e63a1.appspot.com/o/promo1.png?alt=media&token=0fb0327e-7de2-40a4-b737-d710f9843cf9',
  'https://firebasestorage.googleapis.com/v0/b/foodmanage-e63a1.appspot.com/o/promo1.png?alt=media&token=0fb0327e-7de2-40a4-b737-d710f9843cf9',
  'https://firebasestorage.googleapis.com/v0/b/foodmanage-e63a1.appspot.com/o/promo1.png?alt=media&token=0fb0327e-7de2-40a4-b737-d710f9843cf9'
];

final Widget placeholder = Container(color: Colors.grey);

final List child = map<Widget>(
  imgList,
  (index, i) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: Stack(children: <Widget>[
          Image.network(i, fit: BoxFit.cover, width: 1000.0),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(200, 0, 0, 0),
                    Color.fromARGB(0, 0, 0, 0)
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: Text(
                'No. $index image',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  },
).toList();

List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }

  return result;
}

class CarouselDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Manually operated Carousel

    //Auto playing carousel
    final CarouselSlider autoPlayDemo = CarouselSlider(
      viewportFraction: 1.0,
      aspectRatio: 2.0,
      autoPlay: true,
      enlargeCenterPage: true,
      items: imgList.map(
        (url) {
          return Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              child: Image.network(
                url,
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height * 0.3,
                width: 1000.0,
              ),
            ),
          );
        },
      ).toList(),
    );

    return
        // MaterialApp(
        //   // title: 'demo',
        //   home:
        Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfff5f5f2),
        centerTitle: true,
        title: Text(
          "Home",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: "Anakotmai",
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Color(0xff000000),
          ),
        ),
      ),

      body: ListView(
        children: <Widget>[
          Container(
            height: 60,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "โปรโมชั่น",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Anakotmai",
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff000000),
                    ),
                  ),
                  Text(
                    "ดูทั้งหมด",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Anakotmai",
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff4ab6bf),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 10.0,
            ),
            child: Column(children: [
              autoPlayDemo,
            ]),
          ),

          Container(
            height: 60,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "ที่นิยมมากที่สุด",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Anakotmai",
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff000000),
                    ),
                  ),
                  FlatButton(
                      child: Text(
                        "ดูทั้งหมด",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Anakotmai",
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff4ab6bf),
                        ),
                      ),
                      color: Color(0x00000000),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Menu()),
                        );
                      }),
                ],
              ),
            ),
          ),

          // ที่นิยมมากที่สุด    /
          Listview(),
        ],
      ),
      // ),
    );
  }
}
