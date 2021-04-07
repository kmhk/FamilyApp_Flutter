import 'package:flutter/material.dart';
class Textfield_pass extends StatelessWidget {
  final TextEditingController controller;
  const Textfield_pass({
    Key key,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      child:TextField(
        textAlign: TextAlign.right,
        controller: controller,
        style: TextStyle(
            fontSize: 22.0,
            fontFamily: "URW-DIN-Arabic.ttf",
           ),
        autofocus: false,
        obscureText: true,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: '***********' ,
          contentPadding:
          const EdgeInsets.only(
              left: 14.0,
              bottom: 8.0,
              top: 8.0,
              right: 14.0
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(color: Color(0xFF333333).withOpacity(0.3), width: 1.0),
          ),
          enabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(color: Color(0xFF333333).withOpacity(0.3), width: 1.0),
          ),
        ),
      ),
    );
  }
}