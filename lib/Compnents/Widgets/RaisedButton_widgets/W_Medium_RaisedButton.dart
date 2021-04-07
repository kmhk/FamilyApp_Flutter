import 'package:flutter/material.dart';
class w_Medium_RaisedButton extends StatelessWidget {
  const w_Medium_RaisedButton({
    Key key, this.text, this.press,
  }) : super(key: key);
  final String text;
  final Function press;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
          width: 280.00,
          height: 150.00,
          child:  RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(7.0))),
              child: Text(
                "$text",
                style: TextStyle(
                  fontFamily: "URW-DIN-Arabic-Bold",
                  fontSize: 25,
                  color: Colors.black,
                ),
              ),
              padding: EdgeInsets.all(25),
              color: Colors.white,
                onPressed: press,
            ),
      ),
    );
  }
}
