import 'package:family/Compnents/Widgets/IconButton_widgets/Back_IconButton.dart';
import 'package:family/Compnents/Widgets/TextFild_wigets/Textfield_chat.dart';
import 'package:family/Compnents/Widgets/Text_widgets/medium_text.dart';
import 'package:flutter/material.dart';
class Massage extends StatefulWidget {
  @override
  _MassageState createState() => _MassageState();
}

class _MassageState extends State<Massage> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor:Theme.of(context).backgroundColor,
        body: Padding(
          padding: const EdgeInsets.only(top: 50.0,right: 30.0, left: 30.0, bottom: 10.0),
          child: Container(
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Directionality(
                        textDirection: TextDirection.ltr,
                        child: Back_IconButton()),
                    Padding(
                      padding: const EdgeInsets.only(right: 70),
                      child: name(
                        isname: "خالد",
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Textfield_chat(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class name extends StatelessWidget {
  const name({
    Key key, this.isname,
  }) : super(key: key);
  final String isname;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right:5.0, bottom: 40.0),
      child: medium_text(
        text:"$isname"
      ),
    );
  }
}