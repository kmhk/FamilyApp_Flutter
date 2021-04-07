import 'package:family/Model/user_detail.dart';
import 'package:family/Screens/Home_pages_screens/Home_pages_screen.dart';
import 'package:family/Services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pin_entry_text_field/pin_entry_text_field.dart';
class TextField_pin extends StatelessWidget {
  final int dummyOTP;
  final UserDetail user;
  final Function() press;

  const TextField_pin({Key key, this.dummyOTP, this.user, this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: PinEntryTextField(
        fields: 4,
        onSubmit: (String str) async {
          print(str);
          if (int.parse(str) == dummyOTP) {
            AuthService authService = AuthService();

            await authService.saveUserDetails(user);

            press.call();
          } else {
            print("OTP not matched.");
            Fluttertoast.showToast(
              msg: "OTP not matched please try again.",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
            );
          }
        },
        fontSize: 30.00,
        fieldWidth: 70.00,
      ),
    );
  }
}