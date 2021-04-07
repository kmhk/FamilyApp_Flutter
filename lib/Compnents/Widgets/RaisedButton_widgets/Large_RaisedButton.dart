import 'package:flutter/material.dart';
class Large_RaisedButton extends StatelessWidget {
  const Large_RaisedButton({
    Key key, this.text, this.press,
  }) : super(key: key);
  final String text;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return Container(
        width:MediaQuery.of(context).size.width,
        child:  RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(7.0))),
            child: Text(
              "$text",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "URW-DIN-Arabic-Bold",
                fontSize: 25.0,
                color: Colors.white,
              ),
            ),
            padding: EdgeInsets.all(25),
            color: Color(0xFFEE1939),
              onPressed: press,
          ),
    );
  }
}
