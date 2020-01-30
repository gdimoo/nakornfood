import 'package:arfood/screen/home/cart.dart';
import 'package:arfood/screen/home/location.dart';
import 'package:arfood/screen/home/menu.dart';
import 'package:arfood/screen/home/profile.dart';
import 'package:arfood/screen/home/welcome.dart';
import 'package:flutter/material.dart';

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final List<Widget> _widgetOptions = <Widget>[
    CarouselDemo(), 
    Menu(), 
    Locationpage(), 
    Cart(), 
    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
        return Scaffold(
          body: Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
  floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
  floatingActionButton: FloatingActionButton(
    onPressed: () { _onItemTapped(2);},
    tooltip: 'Increment',
    child:Icon(Icons.room,color:Colors.red,size: 65,),
    backgroundColor: Color(0x00000000),
    // backgroundColor: Colors.white,
    elevation: 0.0,
  ),
          bottomNavigationBar: BottomNavigationBar(
            items:const <BottomNavigationBarItem> [
               BottomNavigationBarItem(
                icon: Icon(Icons.store),
                title: Text('หน้าแรก',
      style: TextStyle(
        fontFamily: "Anakotmai",
        fontSize: 14,
        fontWeight: FontWeight.w700,

      ),
    )
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu),
            title: Text('เมนู',
      style: TextStyle(
        fontFamily: "Anakotmai",
        fontSize: 14,
        fontWeight: FontWeight.w700,

    )
      ),
          ),
           BottomNavigationBarItem(
            icon:Icon(Icons.room,color:Color(0x00000000)),
            title: Text('ค้นหาร้านอาหาร',
      style: TextStyle(
        fontFamily: "Anakotmai",
        fontSize: 12,
        fontWeight: FontWeight.w700,
        color: Color(0xffff3501)

    )
      ),
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            title: Text('ตะกร้า',
      style: TextStyle(
        fontFamily: "Anakotmai",
        fontSize: 14,
        fontWeight: FontWeight.w700,

    )
      ),
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('โปรไฟล์',
      style: TextStyle(
        fontFamily: "Anakotmai",
        fontSize: 14,
        fontWeight: FontWeight.w700,

    )
      ),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Color(0xff888890),
        onTap: _onItemTapped,
        // showUnselectedLabels:true,
      ),
    );
  }
}