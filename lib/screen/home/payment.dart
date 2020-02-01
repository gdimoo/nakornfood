import 'package:arfood/screen/auth/forgot.dart';
import 'package:arfood/screen/home/home.dart';
import 'package:arfood/screen/service/auth.dart';
import 'package:arfood/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:arfood/shared/constants.dart';

class Payment extends StatefulWidget {
  final Function toggleView;
  Payment({this.toggleView});

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;

  // text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Color(0xfff5f5f2),
              elevation: 0.0,
              // actions: <Widget>[
              //   FlatButton.icon(
              //     icon: Icon(Icons.person),
              //     label: Text('Register'),
              //     onPressed: () => widget.toggleView(),
              //   ),
              // ],
            ),
            body: ListView(
              children: <Widget>[
                Container(
                  height: 80,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "เข้าสู่ระบบ",
                          textAlign: TextAlign.center,
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
                  padding:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 10.0),
                        TextFormField(
                          decoration:
                              textInputDecoration.copyWith(hintText: 'อีเมล'),
                          validator: (val) =>
                              val.isEmpty ? 'Enter an email' : null,
                          onChanged: (val) {
                            setState(() => email = val);
                          },
                        ),
                        SizedBox(height: 30.0),
                        TextFormField(
                          obscureText: true,
                          decoration: textInputDecoration.copyWith(
                              hintText: 'รหัสผ่าน'),
                          validator: (val) => val.length < 6
                              ? 'Enter a password 6+ chars long'
                              : null,
                          onChanged: (val) {
                            setState(() => password = val);
                          },
                        ),
                        SizedBox(height: 30.0),
                        FlatButton(
                            child: Text(
                              "ลืมรหัสผ่าน ?",
                              // textAlign: TextAlign.right,
                              style: TextStyle(
                                fontFamily: "Anakotmai",
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff000000),
                              ),
                            ),
                            color: Color(0x00000000),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Forgot()),
                              );
                            }),
                        SizedBox(
                          width: 600,
                          height: 49,
                          child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(31.0),
                                //  side: BorderSide(color: Colors.red)
                              ),
                              child: Text(
                                "เข้าสู่ระบบ",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: "Anakotmai",
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff000000),
                                ),
                              ),
                              color: Color(0xffffcc2a),
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  setState(() => loading = true);
                                  dynamic result =
                                      await _auth.signInWithEmailAndPassword(
                                          email, password);

                                  if (result == null) {
                                    setState(() {
                                      error =
                                          'Could not sign in with those credentials';
                                    });
                                  } else {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              MyStatefulWidget()),
                                    );
                                  }
                                  setState(() => loading = false);
                                }
                              }),
                              
                        ),
                        
                      

                      
                      
                        // SizedBox(height: 12.0),
                        Text(
                          error,
                          style: TextStyle(color: Colors.red, fontSize: 14.0),
                        ),
                      ],
                    ),
                  ),
                ),
                Text(
                        "\nเข้าสู่ระบบด้วย",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Anakotmai",
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff000000),
                        ),
                      ),
                
                Container(
                  // height: 80,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        FlatButton(
                            onPressed: () {
                            },
                            child: Image.asset('assets/icons/google-plus.png')),
                        FlatButton(
                            onPressed: () {
                            },
                            child: Image.asset('assets/icons/facebook.png')),
                        FlatButton(
                            onPressed: () {
                            },
                            child: Image.asset('assets/icons/twitter.png')),
                      ],
                    ),
                  ),
                ),
                 Container(
                  // height: 80,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "ยังไม่มีบัญชีผู้ใช้ ?   ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "Anakotmai",
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff000000),
                            // decoration: TextDecoration.underline,
                          ),
                        ),
                        FlatButton(
                          onPressed: () {
                            widget.toggleView();
                            // Navigator.pushNamed(context, "Forgot");
                          },
                          child: new Text(
                            "ลงทะเบียน",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "Anakotmai",
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff000000),
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
