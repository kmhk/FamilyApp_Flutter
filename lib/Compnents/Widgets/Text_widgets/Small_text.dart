import 'package:flutter/material.dart';
class Small_text extends StatelessWidget {
  const Small_text({
    Key key, this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text("$text",
        style: TextStyle(
          fontSize: 13,
          color: Color(0xFFEE1939),
            fontFamily: "URW-DIN-Arabic-Bold"
        ));
  }
}