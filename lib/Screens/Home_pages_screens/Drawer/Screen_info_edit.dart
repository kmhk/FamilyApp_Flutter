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
import 'package:family/Screens/Login_screens/loadingpage.dart';
import 'package:family/Services/families_service.dart';
import 'package:family/app.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import '../Home_pages_screen.dart';

class Screen_info_edit extends StatefulWidget {
  @override
  _Screen_info_editState createState() => _Screen_info_editState();
}

class _Screen_info_editState extends State<Screen_info_edit> {
  TextEditingController name = TextEditingController();

  bool isSwitched = false;
  bool isSwitchedA = false;
  bool isSwitchedB = false;
  bool isSwitchedC = false;
  bool isLoading = false;

  String userId;
  String imageUrl;
  String oldPassword;
  String email;

  File image;

  TextEditingController password = TextEditingController();
  TextEditingController confPassword = TextEditingController();
  String selectedCity;
  String selectedDistrict;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProfile();
    selectedDistrict = currentFamily.value['district'];
    selectedCity = currentFamily.value['living'];
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
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
                      Directionality(
                        textDirection: TextDirection.ltr,
                        child: Row(
                          textDirection: TextDirection.rtl,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Back_IconButton(),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 65.0, bottom: 10),
                              child: medium_text(
                                text: "التعديل",
                              ),
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: Stack(
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(60),
                                child: image == null
                                    ? imageUrl == null
                                        ? Container()
                                        : Image.network(
                                            imageUrl,
                                            height: 120,
                                            width: 120,
                                            fit: BoxFit.cover,
                                          )
                                    : Image.file(
                                        image,
                                        height: 120,
                                        width: 120,
                                        fit: BoxFit.cover,
                                      )),
                            Positioned(
                              bottom: 0,
                              child: FloatingActionButton(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.black,
                                mini: true,
                                onPressed: () async {
                                  image = File((await ImagePicker().getImage(
                                          source: ImageSource.gallery))
                                      .path);
                                  setState(() {});
                                },
                                child: Icon(Icons.add),
                              ),
                            ),
                          ],
                        ),
                      ),
                      mmedium(
                        text: "الإسم",
                      ),
                      Textfield_name(
                        controller: name,
                      ),
                      SizBox(
                        h: 20,
                      ),
                      mmedium(
                        text: "المدينة",
                      ),
                      DropdownButton_city(
                          isDistrict: false,
                          defCity: selectedCity,
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
                      SizBox(
                        h: 20,
                      ),
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
                        text: "حفظ",
                        press: () async {
                          if (validation()) {
                            setState(() {
                              isLoading = true;
                            });
                            if (image != null) {
                              imageUrl = await storageService.uploadPic(image);
                            }
                            Map<String, dynamic> updateData = {
                              'imageUrl': imageUrl,
                              'name': name.text,
                              'showMapLocation': isSwitched,
                              'memberInMaroof': isSwitchedA,
                              'showMobileNumber': isSwitchedB,
                              'haveDeliveryService': isSwitchedC,
                              'district': selectedDistrict,
                              'living': selectedCity,
                            };
                            try {
                              await authService.updateProfile(
                                  userId,
                                  updateData,
                                  password.text.isNotEmpty,
                                  email,
                                  oldPassword,
                                  password.text);
                              Navigator.pop(context);
                            } catch (e) {
                              setState(() {
                                isLoading = false;
                              });
                              Fluttertoast.showToast(
                                  msg: "Something went wrong");
                            }
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            isLoading ? Loadingpage() : Container()
          ],
        ),
      ),
    );
  }

  bool validation() {
    if (password.text == '') {
      return true;
    } else if (password.text != '' && confPassword.text == '') {
      Fluttertoast.showToast(msg: "Enter confirm password");
      return false;
    } else if (password.text != '' && confPassword.text != password.text) {
      Fluttertoast.showToast(msg: "Password is not matched");
      return false;
    } else if (selectedCity == null) {
      Fluttertoast.showToast(msg: "Select city");
      return false;
    } else if (selectedDistrict == null) {
      Fluttertoast.showToast(msg: "Select district");
      return false;
    }
    return true;
  }

  getProfile() async {
    QuerySnapshot querySnapshot = await authService.getProfileData();
    userId = querySnapshot.docs.first.id;
    name.text = querySnapshot.docs.first.data()['name'];
    imageUrl = querySnapshot.docs.first.data()['imageUrl'];
    isSwitched = querySnapshot.docs.first.data()['showMapLocation'];
    isSwitchedA = querySnapshot.docs.first.data()['memberInMaroof'];
    isSwitchedB = querySnapshot.docs.first.data()['showMobileNumber'];
    isSwitchedC = querySnapshot.docs.first.data()['haveDeliveryService'];
    oldPassword = querySnapshot.docs.first.data()['password'];
    email = querySnapshot.docs.first.data()['email'];

    setState(() {});
  }
}
