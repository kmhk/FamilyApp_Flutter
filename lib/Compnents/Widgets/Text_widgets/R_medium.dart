import 'package:flutter/material.dart';
class R_medium extends StatelessWidget {
  const R_medium({
    Key key, this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text("$text",
        style: TextStyle(
          fontSize: 20,
          color: Color(0xFFEE1939),
            fontFamily: "URW-DIN-Arabic-Bold"
        ));
  }
}