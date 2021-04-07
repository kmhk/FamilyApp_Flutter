import 'package:flutter/material.dart';
class Back_IconButton extends StatelessWidget {
  const Back_IconButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 53,
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: new BorderRadius.all(Radius.circular(7)),
      ),
      child: IconButton(
        icon: Icon(Icons.chevron_right,),
        iconSize: 35,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}