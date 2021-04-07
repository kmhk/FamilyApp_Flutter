import 'package:flutter/material.dart';
class mmedium extends StatelessWidget {
  const mmedium({
    Key key, this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 15),
      child: Container(
        child: Text("$text",
              style: TextStyle(
                fontSize: 23,
                  color: Color(0xFF333333),
              )),
      ),
    )
    ;
  }
}