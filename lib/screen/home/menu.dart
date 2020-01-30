import 'package:arfood/screen/home/home.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final TextStyle dropdownMenuItem =
      TextStyle(color: Colors.black, fontSize: 18);

  final primary = Color(0xff696b9e);
  final secondary = Color(0xfff29a94);
  final List<Map> Menu = [
    {
      "name": "แฮมเบอร์เกอร์",
      "location": "572 Statan NY, 12483",
      "type": "Higher Secondary School",
      "logoText":
          "https://positioningmag.com/wp-content/uploads/2019/10/open_mcdonaldPlantbased1.jpg"
    },
    {
      "name": "ปลากระพงราดพริก",
      "location": "234 Road Kathmandu, Nepal",
      "type": "Higher Secondary School",
      "logoText":
          "http://static.asiawebdirect.com/m/phuket/portals/phuket-com/homepage/dining/howto/pagePropertiesImage/thai-food.jpg"
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

    return Scaffold(
        backgroundColor: Color(0xfff5f5f2),
      appBar: AppBar(
        backgroundColor: Color(0xfff5f5f2),
        centerTitle: true,
        
        title: Text(
      "Menu",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: "Anakotmai",
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: Color(0xff000000),
        
        
      ),
    ),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios,color: Colors.black),
          onPressed: () {Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => MyStatefulWidget()),
  );},
      ),
      
        ),
        
        body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 80),
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child: ListView.builder(
                    itemCount: Menu.length,
                    itemBuilder: (BuildContext context, int index) {
                      return buildList(context, index);
                    }),
              ),


              Container(
                height: 80,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
      "รายการทั้งหมด",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: "Anakotmai",
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: Color(0xff000000),
        
        
      ),
    ),
                      Expanded(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 20.0, right: 0.0,top: 15),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        child: TextField(
                          // controller: TextEditingController(text: locations[0]),
                          cursorColor: Color(0xff888890),
                          style: dropdownMenuItem,
                          decoration: InputDecoration(
                              hintText: "ค้นหา",
                              hintStyle: TextStyle(
        fontFamily: "Anakotmai",
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Color(0xff888890),
        
        
      ),
                              suffixIcon: Material(
                                elevation: 0.0,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                child: Icon(Icons.search,color: Color(0xff888890),),
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 13)),
                        ),
                      ),
                    ),
                  ],
                ),
              )
                    ],
                  ),
                ),
              ),
  
        ],
      ),
    ),
          ),
          );
  }
  Widget buildList(BuildContext context, int index) {
    return Container(
      
      decoration: BoxDecoration(
        boxShadow: [
            BoxShadow(
              offset: Offset(0,3), blurRadius: 6,color: Color(0xff000000).withOpacity(0.15)
            )],
    
        color: Colors.white,
      ),
      width: double.infinity,
      height: 120,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),

      child: Row (
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[

          Container(
            width: 100,
            height: 80,
            margin: EdgeInsets.only(right: 15),
            decoration: BoxDecoration(
              // borderRadius: BorderRadius.all(),
        borderRadius: BorderRadius.all(Radius.circular(10)),

              image: DecorationImage(
                  image: CachedNetworkImageProvider(Menu[index]['logoText']),
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
      Menu[index]['name'],
      // textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: "Anakotmai",
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: Color(0xff000000),
        
        
      ),
    ),
                SizedBox(
                  height: 2,
                ),
          
                    Text(
      Menu[index]['type'],
      
      style: TextStyle(
        fontFamily: "Anakotmai",
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: Color(0xff000000).withOpacity(0.5),
        
        
      ),
    ),
                  
                  
                
              ],
            ),
            

          ),
          Center(
            child:Text(
      "1500฿",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: "Anakotmai",
        fontSize: 14,
        fontWeight: FontWeight.w800,
        color: Color(0xff4ab6bf),
        
        
      ),
            ),),

          
      
        ],
      ),
    );
  }
}