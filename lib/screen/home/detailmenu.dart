import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailmenuScreen extends StatefulWidget {
  final String tag;
  final String url;
  final List menu;

  DetailmenuScreen(
      {Key key, @required this.tag, @required this.url, @required this.menu})
      : assert(tag != null),
        assert(url != null),
        assert(menu != null),
        super(key: key);

  @override
  _DetailmenuScreenState createState() => _DetailmenuScreenState();
}

class _DetailmenuScreenState extends State<DetailmenuScreen> {
  @override
  initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  void dispose() {
    //SystemChrome.restoreSystemUIOverlays();
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    super.dispose();
  }

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
          icon: new Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Hero(
              tag: widget.tag,
              child: CachedNetworkImage(
                imageUrl: widget.url,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 0.0),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.menu[1],
                  // textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Anakotmai",
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff000000),
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                ButtonBar(
                  mainAxisSize: MainAxisSize
                      .min, // this will take space as minimum as posible(to center)
                  children: <Widget>[
                    new FlatButton(
                      child: Image.asset('assets/icons/thumbs-up.png'),
                      onPressed: null,
                    ),
                    new FlatButton(
                      child: Image.asset('assets/icons/chat.png'),
                      onPressed: null,
                    ),
                    new FlatButton(
                      child: Image.asset('assets/icons/ar.png'),
                      onPressed: _launchURL,
                    ),
                    new FlatButton(
                      child: Image.asset('assets/icons/photo-camera.png'),
                      onPressed: null,
                    ),
                    new FlatButton(
                      child: Image.asset('assets/icons/star.png'),
                      onPressed: null,
                    ),
                  ],
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  widget.menu[2],
                  style: TextStyle(
                    fontFamily: "Anakotmai",
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff000000).withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
                  height: 10,
                ),
          Text(
            "ราคา 150 ฿",
            style: TextStyle(
              fontFamily: "Anakotmai",
              fontSize: 30,
              fontWeight: FontWeight.w500,
              color: Color(0xffff3501),
            ),
          ),
          SizedBox(
                  height: 10,
                ),

      
            RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(31.0),
                  //  side: BorderSide(color: Colors.red)
                ),
                child: Text(
                  "เพิ่มไปที่ตะกร้า",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Anakotmai",
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff000000),
                  ),
                ),
                color: Color(0xffffcc2a),
                onPressed: () {}),

        ],
      ),
    );
  }
}

_launchURL() async {
  const url = 'https://nakornfood.pythonanywhere.com/ar';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
