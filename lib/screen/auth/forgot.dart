import 'package:arfood/screen/service/auth.dart';
import 'package:arfood/shared/constants.dart';
import 'package:arfood/shared/loading.dart';
import 'package:flutter/material.dart';


class Forgot extends StatefulWidget {

  final Function toggleView;
  Forgot({ this.toggleView });

  @override
  _ForgotState createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool manage = false;
  String error = '';
  bool loading = false;

  // text field state
  String email = '';

    bool _isSelected = false;
  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xfff5f5f2),
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Sign in'),
            onPressed: () => widget.toggleView(),
          ),
        ],
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios,color: Colors.black),
          onPressed: () {Navigator.pop(context);},
      ),
      ),
      body: SingleChildScrollView(child:Container(
        
        padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 30.0),
              Container(
                // height: 80,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
      "รีเซ็ตรหัสผ่าน",
      textAlign: TextAlign.left,
      style: TextStyle(
        fontFamily: "Anakotmai",
        fontSize: 25,
        fontWeight: FontWeight.w800,
        color: Color(0xff000000),
        
        
      ),
    ),
    
          
                    ],
                  ),
                ),
              ),
              Container(
                // height: 40,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
      "โปรดกรอกอีเมลเพื่อส่งลิ้งค์รีเซ็ตรหัสผ่าน",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: "Anakotmai",
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Color(0xff000000),
        
        
      ),
    ),
    
          
                    ],
                  ),
                ),
              ),
              SizedBox(height: 50.0),
              
     
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'email'),
                validator: (val) => val.isEmpty ? 'Enter an email' : null,
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              ),
             

                SizedBox(
      width: 600,
       height: 49,


              child: RaisedButton(
                shape: RoundedRectangleBorder(
           borderRadius: new BorderRadius.circular(31.0),
          //  side: BorderSide(color: Colors.red)
),
                child:Text(
      "ยืนยัน",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: "Anakotmai",
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: Color(0xff000000),
        
        
      ),
    ),

           color: Color(0xffffcc2a),
                onPressed: () {}
                
              ),
       
    ),
    
            ],
          ),
        ),
      ),
      ),
    );
  }
}