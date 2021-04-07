import 'package:flutter/material.dart';
class Textfield_sections extends StatelessWidget {
  const Textfield_sections({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.00, bottom: 15.00),
      child: Container(
        height: 50.0,
        child:TextField(
          textAlign: TextAlign.right,

          style: TextStyle(
              fontSize: 18.0,
             ),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: 'اسم القسم' ,
            contentPadding:
            const EdgeInsets.only(
                left: 14.0,
                bottom: 8.0,
                top: 8.0,
                right: 14.0
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(color: Color(0xFF333333).withOpacity(0.1), width: 1.0),
            ),
            enabledBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(color: Color(0xFF333333).withOpacity(0.1), width: 1.0),
            ),
          ),
        ),
      ),
    );
  }
}
