import 'package:flutter/material.dart';
class Textfield_chat extends StatelessWidget {
  const Textfield_chat({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
               Directionality(
                 textDirection: TextDirection.ltr,
                 child: IconButton(
                      icon: Icon(Icons.send,size: 30,),
                      onPressed: () {},),
               ),
            Spacer(),
            Container(
              width:300,
              child: TextField(
                  textAlign: TextAlign.right,

                  style: TextStyle(
                      fontSize: 18.0,
                     ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding:
                    const EdgeInsets.only(
                        left: 14.0,
                        bottom: 8.0,
                        top: 8.0,
                        right: 14.0
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      borderSide: BorderSide(color: Color(0xFFEE1939).withOpacity(0.5), width: 2.0),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      borderSide: BorderSide(color: Colors.black.withOpacity(0.2), width: 1.0),
                    ),
                  ),
                ),
            ),
          ],
                );
  }
}