
import 'package:arfood/screen/auth/authenticate.dart';
import 'package:arfood/screen/auth/intro.dart';
import 'package:arfood/screen/home/home.dart';
import 'package:arfood/screen/service/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import '../main.dart';
import 'models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    // print(user);
    // return either the Home or Authenticate widget
    if (user == null){
      return IntroScreen();
    } else {
      return MyStatefulWidget();
    }
    
  }
}