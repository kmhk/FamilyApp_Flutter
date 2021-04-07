import 'package:flutter/material.dart';
class card_subscription extends StatelessWidget {
  const card_subscription({
    Key key, this.name, this.text, this.msg,
  }) : super(key: key);
final String name,text;
  final Function msg;

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
                Row(
                  children: [
                    Text("اشتراك",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 26,
                          color: Colors.black,
                        )),
                    Spacer(),
                    Text("$name",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        )),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0,top: 30),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Text("$text",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF333333),
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}