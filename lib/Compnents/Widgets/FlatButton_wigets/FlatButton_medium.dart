import 'package:flutter/material.dart';

class FlatButton_medium extends StatelessWidget {
  const FlatButton_medium({
    Key key, this.text, this.press,
  }) : super(key: key);
  final String text;
  final Function press;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        child: FlatButton(
          child: Text("$text",
              style:
              TextStyle(
                  fontSize: 14,
                  fontFamily:"URW-DIN-Arabic-Bold",
                  color: Color(0xFFEE1939))),
        ),
      ),
    );
  }
}