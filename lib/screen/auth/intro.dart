import 'package:arfood/screen/auth/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
class IntroScreen extends StatefulWidget {
  IntroScreen({Key key}) : super(key: key);

  @override
  IntroScreenState createState() => new IntroScreenState();
}

class IntroScreenState extends State<IntroScreen> {
  List<Slide> slides = new List();

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        title: "แผนที่",
        styleTitle: TextStyle(
        fontFamily: "Anakotmai",
        fontSize: 25,
        fontWeight: FontWeight.w500,
        color: Color(0xff000000),

      ),
        description: "ค้นหาร้านอาหารในสาขาที่ดีที่สุด\nและใกล้ที่สุดสำหรับคุณ",
        styleDescription: TextStyle(
        fontFamily: "Anakotmai",
        fontSize: 20,
        fontWeight: FontWeight.w300,
        color: Color(0xff000000),
        
        
      ),
        pathImage: "assets/images/Maplogo.png",
        backgroundColor: Color(0xffffcc2a),
      ),
    );
    slides.add(
      new Slide(
        title: "AR",
        styleTitle: TextStyle(
        fontFamily: "Anakotmai",
        fontSize: 25,
        fontWeight: FontWeight.w500,
        color: Color(0xff000000),

      ),
        description: "การนำเสนออาหารในรูปแบบ 3 มิติ\nโดยใช้เทคโนโลยี Augmented Reality",
        styleDescription: TextStyle(
        fontFamily: "Anakotmai",
        fontSize: 20,
        fontWeight: FontWeight.w300,
        color: Color(0xff000000),
        
        
      ),
        pathImage: "assets/images/ARlogo.png",
        backgroundColor: Color(0xffffcc2a),
      ),
    );
    slides.add(
      new Slide(
        title: "บุ๊คมาร์ค",
        styleTitle: TextStyle(
        fontFamily: "Anakotmai",
        fontSize: 25,
        fontWeight: FontWeight.w500,
        color: Color(0xff000000),

      ),
         description:"ติดดาวอาหารที่คุณชื่นชอบที่สุด\nเมื่อคุณต้องการในภายหลัง",
        styleDescription: TextStyle(
        fontFamily: "Anakotmai",
        fontSize: 20,
        fontWeight: FontWeight.w300,
        color: Color(0xff000000),
        
     
      ),
        pathImage: "assets/images/Bookmarklogo.png",

        backgroundColor: Color(0xffffcc2a),
      ),
    );
  }

  void onDonePress() {
    Navigator.push(context,MaterialPageRoute(builder: (context) => Authenticate()),
  );
    
  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      slides: this.slides,
      onDonePress: this.onDonePress,
      colorDot: Color(0xffffffff).withOpacity(0.5),
      colorActiveDot: Color(0xffffffff),
    );
  }
}