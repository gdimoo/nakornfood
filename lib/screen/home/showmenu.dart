import 'package:arfood/screen/home/arcam.dart';
import 'package:flutter/material.dart';

class Showmenu extends StatefulWidget {
  @override
  _ShowmenuState createState() => _ShowmenuState();
}

class _ShowmenuState extends State<Showmenu> {

  @override
  Widget build(BuildContext context) {
return Scaffold(
      backgroundColor: Color(0xfff5f5f2),
      appBar: AppBar(
        backgroundColor: Color(0xfff5f5f2),
        centerTitle: true,
        
        title: Text(
      "Detail",
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

          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
  floatingActionButton: FloatingActionButton.extended(
      onPressed: () {
        Navigator.push
        (context,MaterialPageRoute(builder: (context) => MyWebview()),
  );},
      label:Text(
      "arcam",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: "Anakotmai",
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: Color(0xffff3501),
        
        
      ),
    ),
      icon: new Image.asset("assets/img/logo.png"),
      backgroundColor: Colors.white,
    ),
          );
  }
}