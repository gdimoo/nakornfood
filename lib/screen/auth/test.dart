import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_database/firebase_database.dart';

import 'Data.dart';

class Mapmakerservice extends StatefulWidget {
  @override
  final title;
  Mapmakerservice( { this.title } );
  _MapmakerserviceState createState() => _MapmakerserviceState();
}

class _MapmakerserviceState extends State<Mapmakerservice> {
  Completer<GoogleMapController> _controller = Completer();
  
  BitmapDescriptor _markerIcon;
  static const LatLng _center = const LatLng(15.2174899, 104.8575093);
  List<Marker> allMarkers = [];

  List<Data> datalist = [];

  @override
  void initState(){
    super.initState();
    DatabaseReference postsRef = FirebaseDatabase.instance.reference().child("Marker");
    postsRef.once().then((DataSnapshot snap){
      
      var KEYS = [1];
      var DATA = snap.value;
      // var KEYS = snap.value.keys;

      datalist.clear();

      for (var key in KEYS) {
        Data data = new Data(
          DATA[key]['description'],
          DATA[key]['lat'],
          DATA[key]['lng'],
          DATA[key]['title'],
          DATA[key]['type'],
        );

        datalist.add(data);
      }

      setState(() {
        for(var datalatlng in datalist){
          print(datalatlng);
          allMarkers.add(
            Marker(
              markerId: MarkerId(datalatlng.title),
              draggable: true,
              infoWindow: InfoWindow(title: datalatlng.title),
              position: LatLng(datalatlng.lat, datalatlng.lng),
            ),
          );
        }
      });
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    _createMarkerImageFromAsset(context);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(widget.title.toString()),
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          mapType: MapType.terrain,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 13.5,
          ),
          markers: Set.from(allMarkers),
        ),
      ),
    );
  }

  _openOnGoogleMapApp(double latitude, double longitude) async {
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      // Could not open the map.
    }
  }

  Future _createMarkerImageFromAsset(BuildContext context) async {
    if (_markerIcon == null) {
      ImageConfiguration configuration = ImageConfiguration();
      BitmapDescriptor bmpd = await BitmapDescriptor.fromAssetImage(
          configuration, 'images/Marker/checkup.png');
      setState(() {
        _markerIcon = bmpd;
      });
    }
  }
}