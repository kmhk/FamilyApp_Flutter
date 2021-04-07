import 'package:flutter/material.dart';

class Textfield_food extends StatelessWidget {
  final TextEditingController controller;
  const Textfield_food({
    Key key,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      child: TextField(
        controller: controller,
        textAlign: TextAlign.right,
        style: TextStyle(
          fontSize: 18.0,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: "اسم الطبق / الوجبة",
          contentPadding: const EdgeInsets.only(
              left: 14.0, bottom: 8.0, top: 8.0, right: 14.0),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(
                color: Color(0xFF333333).withOpacity(0.1), width: 1.0),
          ),
          enabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(
                color: Color(0xFF333333).withOpacity(0.1), width: 1.0),
          ),
        ),
      ),
    );
  }
}
