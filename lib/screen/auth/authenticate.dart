import 'package:arfood/screen/auth/register.dart';
import 'package:arfood/screen/auth/sign_in.dart';
import 'package:flutter/material.dart';
class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}
  bool showSignIn = true;

class _AuthenticateState extends State<Authenticate> {
  @override
  void toggleView(){
    //print(showSignIn.toString());
    setState(() => showSignIn = !showSignIn);
    
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return SignIn(toggleView:  toggleView);
    } else {
      return Register(toggleView:  toggleView);
    }
  }
}