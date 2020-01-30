import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class StreamBuilderFireStore extends StatelessWidget {
  List<Marker> allmarker;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Firestore.instance.collection('users').snapshots(),
        //print an integer every 2secs, 10 times
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Text("Loading..");
          }
          for(int i=0;i<snapshot.data.documents.length;i++){
            allmarker.add(new Marker(
      markerId: snapshot.data.documents[i]['store']['storename'],
      position: LatLng(
        snapshot.data.documents[i]['store']['location']['lat'],
        snapshot.data.documents[i]['store']['location']['lng'],
      ),
      infoWindow: InfoWindow(title:snapshot.data.documents[i]['store']['storename']),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),));

          }
        },
    );
  }
}