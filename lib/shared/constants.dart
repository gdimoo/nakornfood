import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
  labelStyle: TextStyle(
        fontFamily: "Anakotmai",
        fontSize: 17,
        fontWeight: FontWeight.w300,
        
        
    ),
  fillColor: Color(0xfff5f5f2),
  filled: true,
  contentPadding: EdgeInsets.symmetric(vertical: 15.0,horizontal: 30.0),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 2.0),
    borderRadius: const BorderRadius.all(
          const Radius.circular(30.0),
        ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.white, width: 2.0),
    borderRadius: const BorderRadius.all(
          const Radius.circular(30.0),
        ),

  ),
);
