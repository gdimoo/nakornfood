import 'package:arfood/screen/service/auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
return Scaffold(
      backgroundColor: Color(0xfff5f5f2),
      appBar: AppBar(
        backgroundColor: Color(0xfff5f5f2),
        centerTitle: true,
        
        title: Text(
      "Profile",
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
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              SizedBox(height: 30.0),


              new Container(
      width: 150.0,
      height: 150.0,
      decoration: new BoxDecoration(
          shape: BoxShape.circle,
          image: new DecorationImage(
          fit: BoxFit.fill,
          image: new NetworkImage(
                 "https://firebasestorage.googleapis.com/v0/b/foodmanage-e63a1.appspot.com/o/Untitled-1.png?alt=media&token=90e24817-ef39-44f5-b9ac-87cfb06bbc1d")
                 )
)),
              SizedBox(height: 10.0),

Text(
      "Miguel Olivier",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: "Anakotmai",
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: Color(0xff000000),
        
        
      ),
    ),
              SizedBox(height: 30.0),

    Text(
      "ตั้งค่า",
      textAlign: TextAlign.left,
      style: TextStyle(
        fontFamily: "Anakotmai",
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: Color(0xff000000),
        
        
      ),
    ),
              SizedBox(height: 10.0),

    SizedBox(
      width: 270,
       height: 49,


              child: RaisedButton(
                shape: RoundedRectangleBorder(
           borderRadius: new BorderRadius.circular(31.0),
          //  side: BorderSide(color: Colors.red)
),
                child:Text(
      "แก้ไขโปรไฟล์",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: "Anakotmai",
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: Color(0xff000000),
        
        
      ),
    ),

           color: Color(0xffffffff),
                onPressed: ()  {
                }
                
              ),
       
    ),
              SizedBox(height: 30.0),

    SizedBox(
      width: 270,
       height: 49,


              child: RaisedButton(
                shape: RoundedRectangleBorder(
           borderRadius: new BorderRadius.circular(31.0),
          //  side: BorderSide(color: Colors.red)
),
                child:Text(
      "ประวัติการสั่งซื้อ",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: "Anakotmai",
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: Color(0xff000000),
        
        
      ),
    ),

           color: Color(0xffffffff),
                onPressed: ()  {
                }
                
              ),
       
    ),
              SizedBox(height: 30.0),

    SizedBox(
      width: 270,
       height: 49,


              child: RaisedButton(
                shape: RoundedRectangleBorder(
           borderRadius: new BorderRadius.circular(31.0),
          //  side: BorderSide(color: Colors.red)
),
                child:Text(
      "การชำระเงิน",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: "Anakotmai",
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: Color(0xff000000),
        
        
      ),
    ),

           color: Color(0xffffffff),
                onPressed: ()  {
                }
                
              ),
       
    ),

  
        ],
      ),
    ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
  floatingActionButton: FloatingActionButton.extended(
      onPressed: () async {
                await _auth.signOut();
              },
      label:Text(
      "ออกจากระบบ",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: "Anakotmai",
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: Color(0xffff3501),
        
        
      ),
    ),
      icon: new Image.asset("assets/icons/power.png",height:30),
      backgroundColor: Colors.white,
    ),
          );
  }
}