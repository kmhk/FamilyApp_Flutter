import 'package:family/Compnents/Widgets/RaisedButton_widgets/Small_RaisedButton.dart';
import 'package:flutter/material.dart';
class card_buffet extends StatelessWidget {
  const card_buffet({
    Key key, this.name, this.date, this.text, this.msg,this.status,this.onSendResponse,
  }) : super(key: key);
final String name,date,text;
  final Function msg;
  final bool status;
  final Function onSendResponse;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: InkWell(
        onTap: msg,
        child: Container(
          width:MediaQuery.of(context).size.width,
          decoration: new BoxDecoration(
            boxShadow: const [
              BoxShadow(blurRadius:1,color: Colors.grey ),
            ],
            color: Colors.white,
            borderRadius: new BorderRadius.all(Radius.circular(7)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              textDirection: TextDirection.rtl,
              children: [
                Text("$name",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    )),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20, top: 5),
                  child: Text("$date",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color:Color(0xFFEE1939),
                      )),
                ),

                status ? Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Small_RaisedButton(
                    text: "مراسلة",
                    press: onSendResponse,
                  ),
                ) : Container()
              ],
            ),
          ),
        ),
      ),
    );
  }
}