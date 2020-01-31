import 'package:arfood/screen/home/home.dart';
import 'package:arfood/screen/service/auth.dart';
import 'package:arfood/shared/constants.dart';
import 'package:arfood/shared/loading.dart';
import 'package:flutter/material.dart';

String storename = '';
String desc = '';
String time = '';
String lat = '';
String lng = '';

class LabeledCheckbox extends StatelessWidget {
  const LabeledCheckbox({
    this.label,
    this.padding,
    this.value,
    this.onChanged,
  });

  final String label;
  final EdgeInsets padding;
  final bool value;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!value);
      },
      child: Padding(
        padding: padding,
        child: Row(
          children: <Widget>[
            Expanded(child: Text(label)),
            Checkbox(
              value: value,
              onChanged: (bool newValue) {
                onChanged(newValue);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class StoreForm extends StatefulWidget {
  @override
  _StoreFormState createState() => _StoreFormState();
}

class _StoreFormState extends State<StoreForm> {
  final _formstoreKey = GlobalKey<FormState>();

  bool _isSelected = false;

  String error = '';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 0.0),
        child: Form(
          key: _formstoreKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration:
                    textInputDecoration.copyWith(hintText: 'ชื่อร้านอาหาร'),
                validator: (val) =>
                    val.isEmpty ? 'กรุณาใส่ชื่อร้านอาหาร' : null,
                onChanged: (val) {
                  setState(() => storename = val);
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration:
                    textInputDecoration.copyWith(hintText: 'รายละเอียด'),
                validator: (val) => val.isEmpty ? 'Enter an email' : null,
                onChanged: (val) {
                  setState(() => desc = val);
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration:
                    textInputDecoration.copyWith(hintText: 'เวลาเปิดทำการ'),
                validator: (val) => val.isEmpty ? 'Enter an time' : null,
                onChanged: (val) {
                  setState(() => time = val);
                },
              ),
              SizedBox(height: 20.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              ),
              LabeledCheckbox(
                label: 'ยืนยันข้อมูลร้านอาหาร',
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                value: _isSelected,
                onChanged: (bool newValue) {
                  if (_formstoreKey.currentState.validate()) {
                    setState(() {
                      _isSelected = newValue;
                    });
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool manage = false;
  String error = '';
  bool loading = false;

  // text field state
  String email = '';
  String password = '';
  String name = '';

  // String storename = '';
  // String desc = '';
  // String time = '';
  // String lat = '';
  // String lng = '';

  bool _isSelected = false;
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Color(0xfff5f5f2),
              elevation: 0.0,
              leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios,color: Colors.black),
          onPressed: ()  => widget.toggleView(),
      ),
            ),
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 30.0),
                      Container(
                        // height: 80,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "ลงทะเบียน",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontFamily: "Anakotmai",
                                  fontSize: 25,
                                  fontWeight: FontWeight.w800,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        // height: 40,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "ลงทะเบียนเพื่อดำเนินการต่อ",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: "Anakotmai",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 50.0),
                      TextFormField(
                        decoration: textInputDecoration.copyWith(
                            hintText: 'ชื่อ - นามสกุล'),
                        validator: (val) =>
                            val.isEmpty ? 'กรุณาใส่ชื่อ - นามสกุล' : null,
                        onChanged: (val) {
                          setState(() => name = val);
                        },
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        decoration:
                            textInputDecoration.copyWith(hintText: 'อีเมล์'),
                        validator: (val) =>
                            val.isEmpty ? 'Enter an email' : null,
                        onChanged: (val) {
                          setState(() => email = val);
                        },
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        decoration:
                            textInputDecoration.copyWith(hintText: 'รหัสผ่าน'),
                        obscureText: true,
                        validator: (val) => val.length < 6
                            ? 'Enter a password 6+ chars long'
                            : null,
                        onChanged: (val) {
                          setState(() => password = val);
                        },
                      ),
                      SizedBox(height: 12.0),
                      Text(
                        error,
                        style: TextStyle(color: Colors.red, fontSize: 14.0),
                      ),
                      LabeledCheckbox(
                        label: 'สมัครเป็นร้านอาหาร',
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        value: _isSelected,
                        onChanged: (bool newValue) {
                          setState(() {
                            _isSelected = newValue;
                          });
                        },
                      ),
                      _isSelected == true
                          ? Container(
                              child: StoreForm(),
                            )
                          : Container(
                              child: Text(""),
                            ),
                      SizedBox(
                        width: 600,
                        height: 49,
                        child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(31.0),
                              //  side: BorderSide(color: Colors.red)
                            ),
                            child: Text(
                              "ลงทะเบียน",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: "Anakotmai",
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff000000),
                              ),
                            ),
                            color: Color(0xffffcc2a),
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                setState(() => loading = true);
                                dynamic result =
                                    await _auth.registerWithEmailAndPassword(
                                        email,
                                        password,
                                        name,
                                        _isSelected,
                                        storename,
                                        desc,
                                        time,
                                        lat,
                                        lng);

                                if (result == null) {
                                  setState(() {
                                    loading = false;
                                    error = 'Please supply a valid email';
                                  });
                                } else {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            MyStatefulWidget()),
                                  );
                                }
                                setState(() => loading = false);
                              }
                            }),
                      ),
                      Text(
                        "\nลงทะเบียนด้วย",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Anakotmai",
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff000000),
                        ),
                      ),
                      
                
                Container(
                  // height: 80,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        FlatButton(
                            onPressed: () {
                            },
                            child: Image.asset('assets/icons/google-plus.png')),
                        FlatButton(
                            onPressed: () {
                            },
                            child: Image.asset('assets/icons/facebook.png')),
                        FlatButton(
                            onPressed: () {
                            },
                            child: Image.asset('assets/icons/twitter.png')),
                      ],
                    ),
                  ),
                ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
