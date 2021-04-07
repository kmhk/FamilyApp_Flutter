import 'package:flutter/material.dart';
class Container_sections extends StatelessWidget {
  const Container_sections({
    Key key, this.titile, this.icon,
  }) : super(key: key);
final String titile ;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:10.00, bottom:10.00),
      child: Container(
          width:MediaQuery.of(context).size.width,
          height: 120,
          decoration: new BoxDecoration(
            border: Border.all(
              color: Colors.black,
              style: BorderStyle.solid,
              width: 1.0,
            ),
            boxShadow: const [
              BoxShadow(blurRadius:1,color: Colors.grey ),
            ],
            color: Colors.white,
            borderRadius: new BorderRadius.all(Radius.circular(7)),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top:35.00 ,right:110.00),
            child: Row(
              textDirection: TextDirection.rtl,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:4.00),
                  child: Icon(
                    icon,
                    size:28.00,
                  ),
                ),
                Text("$titile",
                            style: TextStyle(
                              fontSize:28.00,
                              color: Color(0xFFEE1939),
               )),
              ],
            ),
          ),
      ),
    );
  }
}