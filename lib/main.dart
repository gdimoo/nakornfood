import 'package:arfood/screen/auth/intro.dart';
import 'package:arfood/screen/models/user.dart';
import 'package:arfood/screen/service/auth.dart';
import 'package:arfood/screen/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override

  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
      home: Wrapper(),
    ),
    );
  }
}
