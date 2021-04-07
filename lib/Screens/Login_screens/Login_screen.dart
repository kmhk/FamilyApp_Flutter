import 'package:family/Compnents/SizBox/SizBox.dart';
import 'package:family/Compnents/Widgets/FlatButton_wigets/FlatButton_medium.dart';
import 'package:family/Compnents/Widgets/Imge_wigets/Imge_wigets.dart';
import 'package:family/Compnents/Widgets/RaisedButton_widgets/Large_RaisedButton.dart';
import 'package:family/Compnents/Widgets/RaisedButton_widgets/W_Large_RaisedButton.dart';
import 'package:family/Compnents/Widgets/TextFild_wigets/Textfield_num.dart';
import 'package:family/Compnents/Widgets/TextFild_wigets/Textfield_pass.dart';
import 'package:family/Compnents/Widgets/Text_widgets/Large_text.dart';
import 'package:family/Compnents/Widgets/Text_widgets/Small_text.dart';
import 'package:family/Model/user_detail.dart';
import 'package:family/Services/auth_services.dart';
import 'package:family/app.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'Pass_recovery_screen.dart';
import 'Pincode_screen.dart';
import 'package:flutter/material.dart';
import 'Register.dart';
import 'loadingpage.dart';

class Login_screen extends StatefulWidget {
  @override
  _Login_screenState createState() => _Login_screenState();
}

class _Login_screenState extends State<Login_screen> {
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController password = TextEditingController();

  AuthService authService = AuthService();

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
                    top: 50.0, right: 30.0, left: 30.0, bottom: 100.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    textDirection: TextDirection.rtl,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Large_text(
                        text: "تسجيل دخول",
                      ),
                      SizBox(
                        h: 40,
                      ),
                      Imge_wigets(
                        Imge: "Assets/images/MaskGroup2.png",
                      ),
                      Small_text(
                        text: "رقم الجوال",
                      ),
                      SizBox(h: 15),
                      Textfield_num(controller: phoneNumber),
                      SizBox(h: 15),
                      Small_text(
                        text: "كلمة المرور",
                      ),
                      SizBox(h: 15),
                      Textfield_pass(controller: password),
                      SizBox(h: 60),
                      Large_RaisedButton(
                        text: "تسجيل الدخول",
                        press: () async {
                          setState(() {
                            loading = true;
                          });
                          if (validation()) {
                            UserDetail user = await authService
                                .fetchUserInfo(phoneNumber.text.trim());

                            setState(() {
                              loading = false;
                            });

                            if (user != null && user.type == 'family') {
                              UserCredential cred =
                                  await authService.loginUser(user);
                              print(cred.user.uid);
                              String familyId =
                                  await familiesService.getFamilyId();
                              await familiesService.updateLoginDate(familyId);
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return Pincode_screen(user: user);
                              }));
                            } else {
                              Fluttertoast.showToast(
                                msg: "المستخدم غير صحيح",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                              );
                            }
                          } else {
                            setState(() {
                              loading = false;
                            });
                            print("Error");
                            Fluttertoast.showToast(
                              msg: "تحقق من رقم الجوال وبدون صفر وكلمة المرور",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                            );
                          }
                        },
                      ),
                      SizBox(
                        h: 15.0,
                      ),
                      W_Large_RaisedButton(
                        text: "تسجيل جديد",
                        press: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Register();
                          }));
                        },
                      ),
                      Center(
                        child: FlatButton_medium(
                          text: "نسيت كلمة المرور",
                          press: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Pass_recovery_screen();
                            }));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            loading ? Loadingpage() : Container(),
          ],
        ));
  }

  bool validation() {
    if (phoneNumber.text == '' || phoneNumber.text.startsWith("0")) {
      return false;
    } else if (password.text == '') {
      return false;
    }
    return true;
  }
}
