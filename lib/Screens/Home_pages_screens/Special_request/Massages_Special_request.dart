import 'package:family/Compnents/Widgets/IconButton_widgets/Back_IconButton.dart';
import 'package:family/Compnents/Widgets/TextFild_wigets/Textfield_chat.dart';
import 'package:family/Compnents/Widgets/Text_widgets/medium_text.dart';
import 'package:flutter/material.dart';

import 'Special_request.dart';
class Massages_Special_request extends StatefulWidget {
  @override
  _Massages_Special_requestState createState() => _Massages_Special_requestState();
}

class _Massages_Special_requestState extends State<Massages_Special_request> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor:Theme.of(context).backgroundColor,
        body: Padding(
          padding: const EdgeInsets.only(top: 50.0,right: 30.0, left: 30.0, bottom: 10.0),            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Directionality(
                        textDirection: TextDirection.ltr,
                        child: Back_IconButton()),
                    Spacer(),
                    name(
                      isname: "خالد",
                    ),
                    Spacer(),
                    InkWell(
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return Special_request();
                            }));
                      },
                      child: Container(
                          width:150,
                          height: 50,
                          decoration: new BoxDecoration(
                            color: Colors.white,
                            borderRadius: new BorderRadius.all(Radius.circular(5)),
                          ),
                        child:Center(
                          child: Text("اعتذر عن الخدمة",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontFamily: "URW-DIN-Arabic-Bold"
                              )),
                        ),
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