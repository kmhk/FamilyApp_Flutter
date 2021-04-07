import 'package:flutter/material.dart'
;class Large_text extends StatelessWidget {
  const Large_text({
    Key key, this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text("$text",
        style: TextStyle(
          fontSize: 30,
          fontFamily: "URW-DIN-Arabic-Bold"
        ));
  }
}
