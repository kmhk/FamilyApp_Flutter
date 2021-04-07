import 'package:family/Compnents/SizBox/SizBox.dart';
import 'package:family/Compnents/Widgets/Imge_wigets/Imge_wigets.dart';
import 'package:family/Compnents/Widgets/RaisedButton_widgets/Large_RaisedButton.dart';
import 'package:family/Compnents/Widgets/TextFild_wigets/Textfield_pass.dart';
import 'package:family/Compnents/Widgets/Text_widgets/Large_text.dart';
import 'package:family/Compnents/Widgets/Text_widgets/Small_text.dart';
import 'package:family/Model/user_detail.dart';
import 'package:family/Screens/Login_screens/loadingpage.dart';
import 'package:family/app.dart';
import 'package:flutter/material.dart';
import 'Login_screen.dart';

class New_pass_screen extends StatefulWidget {
  UserDetail userData;
  New_pass_screen(this.userData);

  @override
  _New_pass_screen createState() => _New_pass_screen();
}

class _New_pass_screen extends State<New_pass_screen> {

  TextEditingController password = TextEditingController();
  TextEditingController conformPassword = TextEditingController();

  bool passwordTxtShow = false;
  bool conPasswordTxtShow = false;

  String passwordError = "";
  String conformPasswordError = "";

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme
            .of(context)
            .backgroundColor,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 50.0, right: 30.0, left: 30.0, bottom: 10.0),
                child: Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  child: Column(
                    textDirection: TextDirection.rtl,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Large_text(
                        text: "كلمة المرور الجديدة",
                      ),
                      Imge_wigets(
                        Imge: "Assets/images/MaskGroup2.png",
                      ),
                      Small_text(
                        text: "كلمة المرور الجديدة",
                      ),
                      SizBox(
                          h: 15),
                      Textfield_pass(
                        controller: password,
                        // validate: validatePassword,
                      ),
                      Visibility(
                          visible: passwordTxtShow,
                          child: Text(
                              passwordError, style: TextStyle(color: Colors.red))),
                      SizBox(
                          h: 15),
                      Small_text(
                        text: "تاكيد كلمة المرور",
                      ),
                      SizBox(
                          h: 15),
                      Textfield_pass(
                        controller: conformPassword,
                      ),
                      Visibility(
                          visible: conPasswordTxtShow,
                          child: Text(conformPasswordError,
                              style: TextStyle(color: Colors.red))),
                      SizBox(h: 130.00),
                      Large_RaisedButton(
                        text: "حفظ",
                        press: () async {
                          passwordTxtShow = false;
                          conPasswordTxtShow = false;

                          if (password.text.isEmpty) {
                            passwordTxtShow = true;
                            passwordError = "Password empty";
                          } else if (password.text.length < 6) {
                            passwordTxtShow = true;
                            passwordError = "Password min 6 digit";
                          } else {
                            passwordError = "";
                            passwordTxtShow = false;
                          }

                          if (conformPassword.text.isEmpty) {
                            conPasswordTxtShow = true;
                            conformPasswordError = "Conform password empty";
                          } else if (conformPassword.text != password.text) {
                            conPasswordTxtShow = true;
                            conformPasswordError = "Password not matched";
                          } else {
                            conformPasswordError = "";
                            conPasswordTxtShow = false;
                          }

                          if (passwordTxtShow == false &&
                              conPasswordTxtShow == false) {
                            setState(() {
                              isLoading = true;
                            });
                            await authService.loginUser(UserDetail(email: widget.userData.email,password: widget.userData.oldPassword));
                            await authService.resetPassword(password.text.trim(),widget.userData.phone);
                            await authService.logoutUser();
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
                              return Login_screen();
                            }),
                                    (Route<dynamic> route) => false);
                          }
                          setState(() {});

                          /* Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                                return Login_screen();
                              }));*/
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            isLoading ? Loadingpage() : Container()
          ],
        )
    );
  }

}