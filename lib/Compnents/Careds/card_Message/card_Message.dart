import 'package:flutter/material.dart';

class card_Message extends StatelessWidget {
  const card_Message({
    Key key, this.name, this.text, this.msg,
  }) : super(key: key);
final String name, text;
final Function msg;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: msg,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
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
            padding: const EdgeInsets.only(bottom: 20,top: 10,right: 15,left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("$name",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.black,
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 30,bottom: 10),
                  child: Text("$text",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
