import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:animated_dialog_box/animated_dialog_box.dart';
class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  final TextStyle dropdownMenuItem =
      TextStyle(color: Colors.black, fontSize: 18);

  final primary = Color(0xff696b9e);
  final secondary = Color(0xfff29a94);
  final List<Map> menu = [
    {
      "name": "แฮมเบอร์เกอร์",
      "price": "200฿",
      "type": "Higher Secondary School",
      "logoText":
          "https://positioningmag.com/wp-content/uploads/2019/10/open_mcdonaldPlantbased1.jpg"
    },
    {
      "name": "ปลากระพงราดพริก",
      "price": "200฿",
      "location": "234 Road Kathmandu, Nepal",
      "type": "Higher Secondary School",
      "logoText":
          "http://static.asiawebdirect.com/m/phuket/portals/phuket-com/homepage/dining/howto/pagePropertiesImage/thai-food.jpg"
    },
    {
      "name": "Kinder Garden",
      "price": "200฿",
      "location": "572 Statan NY, 12483",
      "type": "Play Group School",
      "logoText":
          "https://cdn.pixabay.com/photo/2016/06/09/18/36/logo-1446293_960_720.png"
    },
    {
      "name": "WilingTon Cambridge",
      "price": "200฿",
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
      "Cart",
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
          onPressed: () {},
      ),
      
        ),
        
        body: SingleChildScrollView(
        child: Container(
                  // padding: const EdgeInsets.symmetric(vertical: 30),

          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 80),
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child: ListView.builder(
                    itemCount: menu.length,
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
      "รายการสั่งซื้อ",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: "Anakotmai",
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: Color(0xff000000),
        
        
      ),
    ),
    MaterialButton(
      shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
      onPressed: () async {
              await animated_dialog_box.showScaleAlertBox(
                  context: context,
                  firstButton: MaterialButton(
                    // FIRST BUTTON IS REQUIRED
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    color: Colors.white,
                    child: Text('ยืนยัน',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: "Anakotmai",
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Color(0xff000000),
        
        
      ),),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  secondButton: MaterialButton(
                    // OPTIONAL BUTTON
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    color: Colors.red,
                    child: Text('ยกเลิก',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: "Anakotmai",
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Color(0xff000000),
        
        
      ),),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  icon: Icon(Icons.payment,color: Color(0xffffcc2a),size: 45,), // IF YOU WANT TO ADD ICON
                  yourWidget: Container(
                // height:MediaQuery.of(context).size.height,
                child:Column(
            children: <Widget>[
              Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                     Text(
      "ยอดรวม  ",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: "Anakotmai",
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: Color(0xff000000),
        
        
      ),
    ),Text(
      "298 ฿",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: "Anakotmai",
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: Color(0xff888890),
        
        
      ),
    )
    
    
          
                    ],
                  ),
              Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                     Text(
      "ส่วนลด  ",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: "Anakotmai",
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: Color(0xff000000),
        
        
      ),
    ),Text(
      "29 ฿",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: "Anakotmai",
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: Color(0xff888890),
        
        
      ),
    )
    
    
          
                    ],
                  ),
              Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                     Text(
      "ค่าจัดส่ง   ",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: "Anakotmai",
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: Color(0xff000000),
        
        
      ),
    ),Text(
      "30 ฿",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: "Anakotmai",
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: Color(0xff888890),
        
        
      ),
    )
    
    
          
                    ],
                  ),
              Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                     Text(
      "รวมทั้งสิ้น   ",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: "Anakotmai",
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: Color(0xff000000),
        
        
      ),
    ),Text(
      "299 ฿",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: "Anakotmai",
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: Color(0xffffcc2a),
        
        
      ),),
              
  
        ],
      ),
            ],
          ),
          ),
                  );
            },
      child:Text(
      "ชำระเงิน",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: "Anakotmai",
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: Color(0xff000000),
        
        
      ),
    ),
      // icon: new Image.asset("assets/img/logo.png"),
      color: Color(0xffffcc2a),
    

    )
          
                    ],
                  ),
                ),
              ),

         ],),
         ),
         )
    
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
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),

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
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: Color(0xff000000),
        
        
      ),
    ),
                // SizedBox(
                //   height: 2,
                // ),
                Text(
      menu[index]['price'],
      // textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: "Anakotmai",
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: Color(0xffffcc2a),
        
        
      ),
    ),
                // SizedBox(
                //   height: 2,
                // ),
          
                    Text(
      menu[index]['type'],
      
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
      "ลบรายการ",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: "Anakotmai",
        fontSize: 12,
        fontWeight: FontWeight.w800,
        color: Color(0xff4ab6bf),
        
        
      ),
            ),),

          
      
        ],
      ),
      
    );
  }
}
