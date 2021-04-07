import 'package:family/Compnents/Widgets/Text_widgets/mmedium_text.dart';
import 'package:family/Compnents/Widgets/drawer/drawer.dart';
import 'package:flutter/material.dart';
class Welcome_card extends StatelessWidget {
  const Welcome_card({
    Key key, this.name, this.menu,
  }) : super(key: key);
  final String name;
  final Function menu;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 40.0,right: 15.0, left: 15.0, bottom:20.0),
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
                mmedium(
                  text: "اهلا و سهلا",
                ),
                Spacer(),
                Container(
                  height: 50,
                  width: 53,
                  decoration: new BoxDecoration(
                    boxShadow: const [
                    ],
                    color: Colors.white,
                    borderRadius: new BorderRadius.all(Radius.circular(7)),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.menu),
                    color: Colors.black,
                    iconSize: 36,
                    onPressed:  (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return drawer_();
                          }));
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Text("$name",
                  style: TextStyle(
                      fontSize: 26,
                      color: Color(0xFF545151),
                      fontFamily: "URW-DIN-Arabic-Bold"
                  )),
            ),
          ],
        ),
      ),
    );
  }
}