import 'package:flutter/material.dart';
class medium_text extends StatelessWidget {
  const medium_text({
    Key key, this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Text("$text",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 26,
            color: Color(0xFF333333),
          )),
    );
  }
}