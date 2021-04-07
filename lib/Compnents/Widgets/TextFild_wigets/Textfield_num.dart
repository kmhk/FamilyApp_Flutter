import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Textfield_num extends StatelessWidget {
  final TextEditingController controller;
  const Textfield_num({Key key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      child: TextField(
        maxLength: 9,
        inputFormatters: [new WhitelistingTextInputFormatter(RegExp("[0-9]"))],
        textAlign: TextAlign.right,
        autocorrect: true,
        controller: controller,
        keyboardType: TextInputType.number,
        cursorColor: Color(Theme.of(context).primaryColor.value),
        decoration: InputDecoration(
          hintText: '538011449',
          contentPadding: const EdgeInsets.only(top: 15.0, right: 10),
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
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 22,
          ),
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(
                color: Color(0xFF333333).withOpacity(0.3), width: 1.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(
                color: Color(0xFF333333).withOpacity(0.3), width: 1.0),
          ),
        ),
      ),
    );
  }
}

class Textfield_email extends StatelessWidget {
  final TextEditingController controller;
  const Textfield_email({Key key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      child: TextField(
        textAlign: TextAlign.right,
        autocorrect: true,
        controller: controller,
        keyboardType: TextInputType.emailAddress,
        cursorColor: Color(Theme.of(context).primaryColor.value),
        decoration: InputDecoration(
          hintText: 'example@example.com',
          contentPadding: const EdgeInsets.only(top: 15.0, right: 10),
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 22,
          ),
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(
                color: Color(0xFF333333).withOpacity(0.3), width: 1.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(
                color: Color(0xFF333333).withOpacity(0.3), width: 1.0),
          ),
        ),
      ),
    );
  }
}

class Textfield_name extends StatelessWidget {
  final TextEditingController controller;
  const Textfield_name({Key key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      child: TextField(
        textAlign: TextAlign.right,
        autocorrect: true,
        controller: controller,
        keyboardType: TextInputType.text,
        cursorColor: Color(Theme.of(context).primaryColor.value),
        decoration: InputDecoration(
          hintText: 'الإسم كامل',
          contentPadding: const EdgeInsets.only(top: 15.0, right: 10),
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 22,
          ),
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(
                color: Color(0xFF333333).withOpacity(0.3), width: 1.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(
                color: Color(0xFF333333).withOpacity(0.3), width: 1.0),
          ),
        ),
      ),
    );
  }
}
