import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'streambuilder_firestore.dart';

Position position;

class Locationpage extends StatefulWidget {
  @override
  LocationpageState createState() => LocationpageState();
}

class LocationpageState extends State<Locationpage> {
  Completer<GoogleMapController> _controller = Completer();
  Widget _child;
// Set<Marker> markers = Set();
  Map<MarkerId, Marker> markers =
      <MarkerId, Marker>{}; // CLASS MEMBER, MAP OF MARKS
  List<dynamic> users = [];
  List<dynamic> markerIDs = [];
  List<double> locationslat = [];
  List<double> locationslng = [];
Firestore db = Firestore.instance;

  submitAll() async {
    db
        .collection('users')
        .snapshots()
        .listen((data) => data.documents.forEach((doc) {
              // print(doc["store"]['storename']);
              // print(users.add(doc.data));
              markerIDs.add(doc["store"]['storename']);

              // print(markerIDs.length);
              // print(markerIDs);
              // setState(() => this.users.add(doc["store"]['storename']));
            }
            
            ));
            
    return 'success';
  }

  // void getMarker() async {
  //   if (await submitAll() != 'success') {
  //     print("Loaded");
  //   } else if(await submitAll() == 'success') {
  //     print("get");
  //     print(users);
  //   }
  // }

// void _add(_markerIdVal,_latitude,_longitude) {
//     var markerIdVal = _markerIdVal;
//     final MarkerId markerId = MarkerId(markerIdVal);

//     // creating a new MARKER
//     Marker marker = Marker(
//       markerId: markerId,
//       position: LatLng(
//         _latitude,
//         _longitude,
//       ),
//       infoWindow: InfoWindow(title:_markerIdVal),
//   icon: BitmapDescriptor.defaultMarkerWithHue(
//     BitmapDescriptor.hueViolet,
//   ),

//     );

//     setState(() {
//       markers[markerId] = marker;
//       // markers.add( marker);
//       // adding a new marker to map
//       // markers[markerId]= marker;
//     });
// }

//           (){
//               return
//          Marker(
//   markerId: MarkerId(doc["store"]['storename']),
//   position: LatLng(double.parse(doc["store"]['location']['lat']), double.parse(doc["store"]['location']['lng'])),
//   infoWindow: InfoWindow(title: 'Gramercy Tavern'),
//   icon: BitmapDescriptor.defaultMarkerWithHue(
//     BitmapDescriptor.hueViolet,
//   ),
// );
//           }
  // print(doc["acc"]['name'])

  // )
  // );

  // }

  @override
  void initState()  {
    // Future.delayed(Duration.zero, () {
      //  getMarker();
      submitAll();
      // print(markerIDs);
      
      _child = SpinKitFadingCircle(
        itemBuilder: (BuildContext context, int index) {
          return DecoratedBox(
            decoration: BoxDecoration(
              color: index.isEven ? Colors.red : Colors.green,
            ),
          );
        },
      );
    // });
    // getCurrentLocation();

    super.initState();
  }
  test(){
    print(markerIDs);
  }

  void getCurrentLocation() async {
    Position res = await Geolocator().getCurrentPosition();
    setState(() {
      position = res;
      _child = mapWidget();
    });
  }

  Widget mapWidget() {
    return Stack(
      children: <Widget>[
        _buildGoogleMap(context),
        _zoomminusfunction(),
        _zoomplusfunction(),
        _buildContainer(),
      ],
    );
  }

  double zoomVal = 5.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Color(0xfff5f5f2),
        centerTitle: true,
        title: Text(
          "Map",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: "Anakotmai",
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Color(0xff000000),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){
              print(markerIDs);
            },
          )
        ],
      ),
      body: _child,
    );
  }

  Widget _zoomminusfunction() {
    return Align(
      alignment: Alignment.topLeft,
      child: IconButton(
          icon: Icon(FontAwesomeIcons.searchMinus, color: Color(0xff6200ee)),
          onPressed: () {
            zoomVal--;
            _minus(zoomVal);
          }),
    );
  }

  Widget _zoomplusfunction() {
    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
          icon: Icon(FontAwesomeIcons.searchPlus, color: Color(0xff6200ee)),
          onPressed: () {
            zoomVal++;
            _plus(zoomVal);
          }),
    );
  }

  Future<void> _minus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(40.712776, -74.005974), zoom: zoomVal)));
  }

  Future<void> _plus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(40.712776, -74.005974), zoom: zoomVal)));
  }

  Widget _buildContainer() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 150.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://lh5.googleusercontent.com/p/AF1QipO3VPL9m-b355xWeg4MXmOQTauFAEkavSluTtJU=w225-h160-k-no",
                  40.738380,
                  -73.988426,
                  "Gramercy Tavern"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://lh5.googleusercontent.com/p/AF1QipMKRN-1zTYMUVPrH-CcKzfTo6Nai7wdL7D8PMkt=w340-h160-k-no",
                  40.761421,
                  -73.981667,
                  "Le Bernardin"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://images.unsplash.com/photo-1504940892017-d23b9053d5d4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
                  40.732128,
                  -73.999619,
                  "Blue Hill"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _boxes(String _image, double lat, double long, String restaurantName) {
    return GestureDetector(
      onTap: () {
        _gotoLocation(lat, long);
      },
      child: Container(
        child: new FittedBox(
          child: Material(
              color: Colors.white,
              elevation: 14.0,
              borderRadius: BorderRadius.circular(24.0),
              shadowColor: Color(0x802196F3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 180,
                    height: 200,
                    child: ClipRRect(
                      borderRadius: new BorderRadius.circular(24.0),
                      child: Image(
                        fit: BoxFit.fill,
                        image: NetworkImage(_image),
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: myDetailsContainer1(restaurantName),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  Widget myDetailsContainer1(String restaurantName) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Text(
            restaurantName,
            style: TextStyle(
                color: Color(0xff6200ee),
                fontSize: 24.0,
                fontWeight: FontWeight.bold),
          )),
        ),
        SizedBox(height: 5.0),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
                child: Text(
              "4.1",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 18.0,
              ),
            )),
            Container(
              child: Icon(
                FontAwesomeIcons.solidStar,
                color: Colors.amber,
                size: 15.0,
              ),
            ),
            Container(
              child: Icon(
                FontAwesomeIcons.solidStar,
                color: Colors.amber,
                size: 15.0,
              ),
            ),
            Container(
              child: Icon(
                FontAwesomeIcons.solidStar,
                color: Colors.amber,
                size: 15.0,
              ),
            ),
            Container(
              child: Icon(
                FontAwesomeIcons.solidStar,
                color: Colors.amber,
                size: 15.0,
              ),
            ),
            Container(
              child: Icon(
                FontAwesomeIcons.solidStarHalf,
                color: Colors.amber,
                size: 15.0,
              ),
            ),
            Container(
                child: Text(
              "(946)",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 18.0,
              ),
            )),
          ],
        )),
        SizedBox(height: 5.0),
        Container(
            child: Text(
          "American \u00B7 \u0024\u0024 \u00B7 1.6 mi",
          style: TextStyle(
            color: Colors.black54,
            fontSize: 18.0,
          ),
        )),
        SizedBox(height: 5.0),
        Container(
            child: Text(
          "Closed \u00B7 Opens 17:00 Thu",
          style: TextStyle(
              color: Colors.black54,
              fontSize: 18.0,
              fontWeight: FontWeight.bold),
        )),
      ],
    );
  }

  Widget _buildGoogleMap(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
            target: LatLng(position.latitude, position.longitude), zoom: 15),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: {
          newyork1Marker,
          newyork2Marker,
          newyork3Marker,
          gramercyMarker,
          bernardinMarker,
          blueMarker,
          current,
        },
      ),
    );
  }

  Future<void> _gotoLocation(double lat, double long) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(lat, long),
      zoom: 15,
      tilt: 50.0,
      bearing: 45.0,
    )));
  }
}

Marker current = Marker(
    markerId: MarkerId('home'),
    position: LatLng(position.latitude, position.longitude),
    icon: BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueAzure,
    ),
    infoWindow: InfoWindow(title: "Home"));

Marker gramercyMarker = Marker(
  markerId: MarkerId('gramercy'),
  position: LatLng(40.738380, -73.988426),
  infoWindow: InfoWindow(title: 'Gramercy Tavern'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);

Marker bernardinMarker = Marker(
  markerId: MarkerId('bernardin'),
  position: LatLng(40.761421, -73.981667),
  infoWindow: InfoWindow(title: 'Le Bernardin'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
Marker blueMarker = Marker(
  markerId: MarkerId('bluehill'),
  position: LatLng(40.732128, -73.999619),
  infoWindow: InfoWindow(title: 'Blue Hill'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);

//New York Marker

Marker newyork1Marker = Marker(
  markerId: MarkerId('newyork1'),
  position: LatLng(40.742451, -74.005959),
  infoWindow: InfoWindow(title: 'Los Tacos'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
Marker newyork2Marker = Marker(
  markerId: MarkerId('newyork2'),
  position: LatLng(40.729640, -73.983510),
  infoWindow: InfoWindow(title: 'Tree Bistro'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
Marker newyork3Marker = Marker(
  markerId: MarkerId('newyork3'),
  position: LatLng(40.719109, -74.000183),
  infoWindow: InfoWindow(title: 'Le Coucou'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);

// class Firemap extends StatefulWidget {
//   @override
//   _FiremapState createState() => _FiremapState();
// }

// class _FiremapState extends State<Firemap> {

//   Future getUser() async{
//     var firestore = Firestore.instance;
//     QuerySnapshot qn = await firestore.collection('users').getDocuments();
//     print(qn.documents);
//     return qn.documents;
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Container(

//     );
//   }
// }
