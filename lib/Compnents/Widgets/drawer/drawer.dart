import 'package:family/Screens/Home_pages_screens/Drawer/Screen_info_edit.dart';
import 'package:family/Screens/Home_pages_screens/Drawer/Terms.dart';
import 'package:family/Screens/Home_pages_screens/Drawer/support_chat.dart';
import 'package:family/Screens/Login_screens/Login_screen.dart';
import 'package:family/Screens/chat_dashboard/admin_chat_screen.dart';
import 'package:family/Screens/chat_dashboard/chat_screen.dart';
import 'package:family/Services/families_service.dart';
import 'package:family/app.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class drawer_ extends StatelessWidget {
  const drawer_({Key key, this.name, this.imageUrl}) : super(key: key);
  final String name;
  final String imageUrl;

  //CALLING
  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 10.0,
      child: Container(
        color: Color(0xFFF7F6FC),
        child: Column(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFFF7F6FC),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: Text("$name",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF545151),
                        )),
                  ),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: Image.network(
                        imageUrl,
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      )),
                ],
              ),
            ),
            Container(
              height: 40,
              child: ListTile(
                leading: Icon(
                  Icons.folder,
                  color: Colors.black,
                ),
                title: Text(
                  'التعديل',
                  style: TextStyle(
                    fontFamily: "URW-DIN-Arabic-Bold",
                    fontSize: 17,
                  ),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Screen_info_edit();
                  }));
                },
              ),
            ),
            Container(
              height: 40,
              child: ListTile(
                leading: Icon(
                  Icons.markunread,
                  color: Colors.black,
                ),
                title: Text(
                  'مراسلة الدعم الفني',
                  style: TextStyle(
                      fontFamily: "URW-DIN-Arabic-Bold", fontSize: 17),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return AdminChatScreen(
                      sender: currentFamily.value['phone'],
                      reciever: "509503348",
                      name: "Admin",
                    );
                  }));
                },
              ),
            ),
            Container(
              height: 40,
              child: ListTile(
                onTap: () {
                  _launchURL("tel:0547810009");
                },
                leading: Icon(
                  Icons.call,
                  color: Colors.black,
                ),
                title: Text(
                  'الإتصال بالدعم الفني',
                  style: TextStyle(
                      fontFamily: "URW-DIN-Arabic-Bold", fontSize: 17),
                ),
              ),
            ),
            Container(
              height: 40,
              child: ListTile(
                leading: Icon(
                  Icons.pages,
                  color: Colors.black,
                ),
                title: Text(
                  'الاحكام والشروط',
                  style: TextStyle(
                      fontFamily: "URW-DIN-Arabic-Bold", fontSize: 17),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Terms();
                  }));
                },
                focusColor: Colors.red,
              ),
            ),
            Container(
              height: 40,
              child: ListTile(
                leading: Icon(
                  Icons.lock_open,
                  color: Colors.black,
                ),
                title: Text(
                  'تسجيل خروج',
                  style: TextStyle(
                      fontFamily: "URW-DIN-Arabic-Bold", fontSize: 17),
                ),
                onTap: () async {
                  await authService.logoutUser();
                  Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (context) {
                    return Login_screen();
                  }), (Route<dynamic> route) => false);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
