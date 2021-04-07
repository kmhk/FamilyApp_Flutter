import 'package:flutter/material.dart';
class Textfield_Advertising extends StatelessWidget {
  final TextEditingController controller;
  const Textfield_Advertising({
    Key key,
    this.controller
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextField(
          controller: controller,
          minLines: 5,
          maxLines: 15,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
          ),
        ),
      ),
    );
  }
}