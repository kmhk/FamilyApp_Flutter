import 'package:flutter/material.dart';
class W_Large_RaisedButton extends StatelessWidget {
  const W_Large_RaisedButton({
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
              style: TextStyle(
                fontFamily: "URW-DIN-Arabic-Bold",
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            padding: EdgeInsets.all(25),
          color: Colors.white,
              onPressed: press,
          ),
    );
  }
}
