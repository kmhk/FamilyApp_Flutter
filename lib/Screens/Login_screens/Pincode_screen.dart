import 'package:countdown_flutter/countdown_flutter.dart';
import 'package:family/Compnents/SizBox/SizBox.dart';
import 'package:family/Compnents/Widgets/FlatButton_wigets/FlatButton_medium.dart';
import 'package:family/Compnents/Widgets/IconButton_widgets/Back_IconButton.dart';
import 'package:family/Compnents/Widgets/Imge_wigets/Imge_wigets.dart';
import 'package:family/Compnents/Widgets/RaisedButton_widgets/Large_RaisedButton.dart';
import 'package:family/Compnents/Widgets/TextFild_wigets/TextField_pin.dart';
import 'package:family/Compnents/Widgets/Text_widgets/Large_text.dart';
import 'package:family/Compnents/Widgets/Text_widgets/Small_text.dart';
import 'package:family/Model/user_detail.dart';
import 'package:family/Screens/Home_pages_screens/Home_pages_screen.dart';
import 'package:family/Services/auth_services.dart';
import 'package:family/Services/notificationServices.dart';
import 'package:family/app.dart';
import 'package:flutter/material.dart';
class Pincode_screen extends StatefulWidget {
  UserDetail user;
  Pincode_screen({this.user});
  @override
  _Pincode_screenState createState() => _Pincode_screenState();
}

class _Pincode_screenState extends State<Pincode_screen> {

  TextEditingController otp = TextEditingController();

  AuthService authService = AuthService();

  int dummyOTP;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    generateOTP();
  }

  generateOTP()async {
    dummyOTP = await authService.generateOTP(widget.user.phone);
    print("Dummy OTP : $dummyOTP");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body:SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 50.0,right: 30.0, left: 30.0, bottom: 50.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                textDirection: TextDirection.rtl,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Back_IconButton(),
                  SizBox(
                    h: 30,
                  ),
                  Large_text(
                    text: "رمز التحقق",
                  ),
                  SizBox(
                    h:20,
                  ),
                  Center(
                    child: Container(
                      height: 176,
                      width: 270,
                      child: Imge_wigets(
                        Imge:"Assets/images/pincode.png" ,
                      ),
                    ),
                  ),
                  SizBox(
                    h:20,
                  ),
                  TextField_pin(dummyOTP:dummyOTP,user: widget.user,press: () async {
                    String familyId = await familiesService.getFamilyId();
                    await prefs.setString('familyId', familyId);
                    await familiesService.updateLoginDate(familyId);
                    await NotificationService.getTokenAndUpdate(widget.user.phone);
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
                      return Home_pages_screen();
                    }),
                    (Route<dynamic> route) => false);
                  }),
                  SizBox(
                    h:30,
                  ),
                  Center(
                    child: CountdownFormatted(
                      duration: Duration(minutes: 4),
                      builder: (BuildContext ctx, String remaining) {
                        return Text(
                          remaining,
                          style: TextStyle(fontSize: 16,
                            color: Color(0xFFEE1939),
                          ),
                        ); // 01:00:00
                      },
                    ),
                  ),

                  Small_text(
                    text: "$dummyOTP",
                  ),
                  SizBox(
                    h:70,
                  ),
                  Large_RaisedButton(
                    text: "تحقق",
                    press: (){
                     /* Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return Home_pages_screen();
                          }));*/
                    },
                  ),
                  Center(
                    child: FlatButton_medium(
                      text: "إعادة ارسال الرمز",
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
  bool validation (){
    if(otp.text == ''){
      return false;
    }else{

    }
    return true;
  }
}




