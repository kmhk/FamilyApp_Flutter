import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:family/Compnents/SizBox/SizBox.dart';
import 'package:family/Compnents/Widgets/DropdownButton_wigets/DropdownButton_city.dart';
import 'package:family/Compnents/Widgets/IconButton_widgets/Back_IconButton.dart';
import 'package:family/Compnents/Widgets/Imge_wigets/Circl_imge.dart';
import 'package:family/Compnents/Widgets/RaisedButton_widgets/Large_RaisedButton.dart';
import 'package:family/Compnents/Widgets/TextFild_wigets/Textfield_Empty.dart';
import 'package:family/Compnents/Widgets/TextFild_wigets/Textfield_num.dart';
import 'package:family/Compnents/Widgets/TextFild_wigets/Textfield_pass.dart';
import 'package:family/Compnents/Widgets/TextFild_wigets/Textfield_phon.dart';
import 'package:family/Compnents/Widgets/Text_widgets/medium_text.dart';
import 'package:family/Compnents/Widgets/Text_widgets/mmedium_text.dart';
import 'package:family/Model/user_detail.dart';
import 'package:family/Screens/Login_screens/loadingpage.dart';
import 'package:family/app.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'Login_screen.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool isSwitched = false;
  bool isSwitchedA = false;
  bool isSwitchedB = false;
  bool isSwitchedC = false;
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confPassword = TextEditingController();
  String selectedCity;
  String selectedDistrict;
  File image;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 50.0, right: 30.0, left: 30.0, bottom: 10.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  textDirection: TextDirection.rtl,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      textDirection: TextDirection.rtl,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Back_IconButton(),
                        Padding(
                          padding:
                              const EdgeInsets.only(right: 65.0, bottom: 10),
                          child: medium_text(
                            text: "التسجيل",
                          ),
                        ),
                      ],
                    ),
                    Center(
                      child: Circl_imge(
                          Imge:
                              image == null ? "Assets/images/home-4.png" : null,
                          pickedImge: image,
                          callback: () {
                            _showPicker(context);
                          }),
                    ),
                    mmedium(
                      text: "رقم الجوال",
                    ),
                    Textfield_phon(controller: phoneNumber),
                    // mmedium(
                    //   text: "البريد الإلكتروني",
                    // ),
                    //   Textfield_email(controller: email),
                    mmedium(
                      text: "الإسم",
                    ),
                    Textfield_name(controller: name),
                    mmedium(
                      text: "المدينة",
                    ),
                    // DropdownButton_city(),
                    DropdownButton_city(
                        isDistrict: false,
                        callBack: (value) {
                          selectedCity = value;
                          selectedDistrict = null;
                          setState(() {});
                        }),
                    mmedium(
                      text: "الحي",
                    ),
                    DropdownButton_city(
                        isDistrict: true,
                        city: selectedCity,
                        defCity: selectedDistrict,
                        callBack: (value) {
                          selectedDistrict = value;
                          setState(() {});
                        }),
                    mmedium(
                      text: "كلمة المرور",
                    ),
                    Textfield_pass(controller: password),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: mmedium(
                        text: "تاكيد كلمة المرور",
                      ),
                    ),
                    Textfield_pass(controller: confPassword),
                    SizBox(
                      h: 20,
                    ),
                    Row(
                      textDirection: TextDirection.rtl,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("السماح ب عرض موقعي على الخريطة",
                                style: TextStyle(
                                    fontSize: 16, color: Color(0xFF707070))),
                          ),
                        ),
                        Switch(
                          value: isSwitched,
                          onChanged: (value) {
                            setState(() {
                              isSwitched = value;
                              print(isSwitched);
                            });
                          },
                          activeColor: Color(0xFFEE1939),
                        ),
                      ],
                    ),
                    Row(
                      textDirection: TextDirection.rtl,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("هل انتِ مسجلة بخدمة معروف ؟",
                                style: TextStyle(
                                    fontSize: 16, color: Color(0xFF333333))),
                          ),
                        ),
                        Switch(
                          value: isSwitchedA,
                          onChanged: (value) {
                            setState(() {
                              isSwitchedA = value;
                              print(isSwitchedA);
                            });
                          },
                          activeColor: Color(0xFFEE1939),
                        ),
                      ],
                    ),
                    Row(
                      textDirection: TextDirection.rtl,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("السماح بعرض رقم الهاتف للعملاء",
                                style: TextStyle(
                                    fontSize: 16, color: Color(0xFF333333))),
                          ),
                        ),
                        Switch(
                          value: isSwitchedB,
                          onChanged: (value) {
                            setState(() {
                              isSwitchedB = value;
                              print(isSwitchedB);
                            });
                          },
                          activeColor: Color(0xFFEE1939),
                        ),
                      ],
                    ),
                    Row(
                      textDirection: TextDirection.rtl,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("هل توفري خدمة التوصيل ؟",
                                style: TextStyle(
                                    fontSize: 16, color: Color(0xFF333333))),
                          ),
                        ),
                        Switch(
                          value: isSwitchedC,
                          onChanged: (value) {
                            setState(() {
                              isSwitchedC = value;
                              print(isSwitchedC);
                            });
                          },
                          activeColor: Color(0xFFEE1939),
                        ),
                      ],
                    ),
                    SizBox(
                      h: 20,
                    ),
                    Large_RaisedButton(
                      text: "تسجيل",
                      press: () async {
                        try {
                          if (validation()) {
                            setState(() {
                              loading = true;
                            });
                            bool valid = await authService.checkAvailibility(
                                UserDetail(
                                    password: password.text.trim(),
                                    email: "${phoneNumber.text.trim()}" +
                                        "osrahstation.com",
                                    phone: phoneNumber.text.trim()));
                            if (valid) {
                              print("${phoneNumber.text}@osrahstation.com");
                              UserCredential userC =
                                  await authService.registerUser(UserDetail(
                                      password: password.text.trim(),
                                      email:
                                          "${phoneNumber.text.trim()}@osrahstation.com"));
                              print("-------------------");
                              print(userC.user.uid);
                              print("-------------------");
                              String url =
                                  await storageService.uploadPic(image);
                              print("-------------------");
                              print(url);
                              print("-------------------");
                              Position location = await _determinePosition();
                              await authService.addUserData(
                                  phoneNumber.text.trim(),
                                  password.text.trim(),
                                  userC.user.uid,
                                  name.text.trim(),
                                  "${phoneNumber.text.trim()}@osrahstation.com",
                                  "family",
                                  url,
                                  isSwitched,
                                  isSwitchedA,
                                  isSwitchedB,
                                  isSwitchedC,
                                  selectedCity,
                                  selectedDistrict,
                                  location == null
                                      ? null
                                      : GeoPoint(location.latitude,
                                          location.longitude));
                              await authService.logoutUser();
                              print("-------------------");

                              Navigator.pushAndRemoveUntil(context,
                                  MaterialPageRoute(builder: (context) {
                                return Login_screen();
                              }), (Route<dynamic> route) => false);
                            } else {}
                          }
                        } catch (ex) {
                          print(ex.toString());
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          loading ? Loadingpage() : Container(),
        ],
      ),
    );
  }

  bool validation() {
    if (phoneNumber.text == '' || phoneNumber.text.startsWith("0")) {
      Fluttertoast.showToast(msg: "ادخل رقم الجوال وبدون صفر");
      return false;
      // } else if (email.text == '') {
      //   Fluttertoast.showToast(msg: "Enter email");
      //   return false;
    } else if (password.text == '') {
      Fluttertoast.showToast(msg: "ادخل الرقم السري");
      return false;
    } else if (confPassword.text == '') {
      Fluttertoast.showToast(msg: "ادخل كلمة المرور");
      return false;
    } else if (confPassword.text != password.text) {
      Fluttertoast.showToast(msg: "كلمة المرور غير مطابقة");
      return false;
    } else if (image == null) {
      Fluttertoast.showToast(msg: "إختر صورة البروفايل");
      return false;
    } else if (selectedCity == null) {
      Fluttertoast.showToast(msg: "إختر المدينة");
      return false;
    } //else if (selectedDistrict == null) {
    //Fluttertoast.showToast(msg: "Select district");
    //    return false;
    ////  }
    return true;
  }

  Future getImage(ImageSource source) async {
    final pickedFile = await ImagePicker().getImage(source: source);

    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
        Navigator.pop(context);
      } else {
        print('No image selected.');
      }
    });
  }

  void _showPicker(context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 70,
                            color: Colors.white,
                            child: MaterialButton(
                              onPressed: () async {
                                await getImage(ImageSource.gallery)
                                    .then((value) {});
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Center(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.85,
                                    child: Center(
                                      child: Text(
                                        'مكتبة الصور',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                  ),
                                ),
                                //  new ListTile(
                                //    leading: new Icon(Icons.photo_library),
                                //   title: new Text('مكتبة الصور'),
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 70,
                            color: Colors.white,
                            child: MaterialButton(
                              onPressed: () async {
                                await getImage(ImageSource.camera)
                                    .then((value) {});
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Center(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.85,
                                    child: Center(
                                      child: new Text(
                                        'آلة تصوير',
                                        // style: TextStyle(color: Colors.redAccent[400]),

                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                  ),
                                ),
                                //  new ListTile(
                                //    leading: new Icon(Icons.photo_library),
                                //   title: new Text('مكتبة الصور'),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // serviceEnabled = await Geolocator.isLocationServiceEnabled();
    // if (!serviceEnabled) {
    //   errorToast("Location services are disabled.");
    //   return Future.error('Location services are disabled.');
    // }

    permission = await Geolocator.checkPermission();

    print(permission.toString());

    if (permission == LocationPermission.deniedForever) {
      return null;
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        Fluttertoast.showToast(msg: 'Location permissions is denied.');
        return Future.error('Location permissions is denied.');
      }
    }

    Position pos = await Geolocator.getCurrentPosition();
    return pos;
  }
}
