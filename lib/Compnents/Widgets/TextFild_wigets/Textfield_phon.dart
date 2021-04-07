import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Textfield_phon extends StatelessWidget {
  final TextEditingController controller;
  const Textfield_phon({Key key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      child: TextField(
        textAlign: TextAlign.right,
        keyboardType: TextInputType.number,
        maxLength: 9,
        inputFormatters: [new WhitelistingTextInputFormatter(RegExp("[0-9]"))],
        controller: controller,
        style: TextStyle(
          fontSize: 22.0,
          fontFamily: "URW-DIN-Arabic.ttf",
        ),
        decoration: InputDecoration(
          hintText: "501234567",
          prefixIcon: Container(
            width: 70.0,
            padding: const EdgeInsets.only(
              left: 15.0,
              top: 10.0,
            ),
            margin: const EdgeInsets.only(right: 5.0),
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(
                  color: Color(0xFFBBB5B5),
                  width: 1.0,
                ),
              ),
            ),
            child: Text("+966",
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xFFEE1939),
                  fontWeight: FontWeight.bold,
                )),
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.only(
              left: 14.0, bottom: 8.0, top: 8.0, right: 14.0),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(
                color: Color(0xFF333333).withOpacity(0.3), width: 1.0),
          ),
          enabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(
                color: Color(0xFF333333).withOpacity(0.3), width: 1.0),
          ),
        ),
      ),
    );
  }
}
