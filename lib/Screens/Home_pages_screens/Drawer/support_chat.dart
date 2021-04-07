import 'package:family/Compnents/Widgets/IconButton_widgets/Back_IconButton.dart';
import 'package:family/Compnents/Widgets/TextFild_wigets/Textfield_chat.dart';
import 'package:family/Compnents/Widgets/Text_widgets/medium_text.dart';
import 'package:flutter/material.dart';
class support_chat extends StatefulWidget {
  @override
  _support_chatState createState() => _support_chatState();
}

class _support_chatState extends State<support_chat> {
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
                      padding: const EdgeInsets.only(right:40),
                      child:medium_text(
                          text:'الدعم الفني'
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
