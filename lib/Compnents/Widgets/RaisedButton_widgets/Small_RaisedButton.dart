import 'package:flutter/material.dart';
class Small_RaisedButton extends StatelessWidget {
  const Small_RaisedButton({
    Key key, this.text, this.press,
  }) : super(key: key);
  final String text;
  final Function press;


  @override
  Widget build(BuildContext context) {
    return  Container(
          width: 185.00,
          height: 40.00,
          child:  RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(7.0))),
              child: Text(
                "$text",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "URW-DIN-Arabic-Bold",
                  fontSize:16,
                  color: Colors.white,
                ),
              ),
              color: Color(0xFFEE1939),
                onPressed: press,
            ),
      );
  }
}
