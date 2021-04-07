import 'package:family/Compnents/SizBox/SizBox.dart';
import 'package:family/Compnents/Widgets/IconButton_widgets/Back_IconButton.dart';
import 'package:family/Compnents/Widgets/Imge_wigets/Imge_wigets.dart';
import 'package:family/Compnents/Widgets/RaisedButton_widgets/Large_RaisedButton.dart';
import 'package:family/Compnents/Widgets/TextFild_wigets/Textfield_num.dart';
import 'package:family/Compnents/Widgets/Text_widgets/Large_text.dart';
import 'package:family/Compnents/Widgets/Text_widgets/Small_text.dart';
import 'package:family/Model/user_detail.dart';
import 'package:family/app.dart';
import 'package:flutter/material.dart';
import 'New_pass_screen.dart';
import 'Pincode_screen_new_pas.dart';

class Pass_recovery_screen extends StatefulWidget {
  @override
  _Pass_recovery_screenState createState() => _Pass_recovery_screenState();
}

class _Pass_recovery_screenState extends State<Pass_recovery_screen> {

  TextEditingController phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0,right: 30.0, left: 30.0, bottom:20.0),
          child: Container(
            width:MediaQuery.of(context).size.width,
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
                    Large_text(
                      text: "استعادة كلمة المرور",
                    ),
                  ],
                ),
                Imge_wigets(
                  Imge:"Assets/images/MaskGroup2.png" ,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 5 , bottom: 10),
                  child: Small_text(
                  text: "رقم الجوال",
                  ),
                ),
                SizBox(
                  h: 10.00,
                ),
                Textfield_num(controller:phone),
                SizBox(
                  h: 170.00,
                ),
                Large_RaisedButton(
                  text: "استعادة",
                  press: () async {
                    if(validation()){

                      UserDetail user = await authService.fetchUserInfo(phone.text.trim());

                      if(user!=null){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return Pincode_screen_new_pas(user);
                            }));
                      }
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }


  validation() {
    if(phone.text.trim()==""){
      return false;
    }
    return true;
  }
}


