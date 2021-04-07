import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:family/Compnents/SizBox/SizBox.dart';
import 'package:flutter/material.dart';
class Card_requestst extends StatelessWidget {
  const Card_requestst({
    Key key, this.imge,  this.food, this.name_food,this.doc,
  }) : super(key: key);
  final String imge , name_food   ;
  final  DocumentSnapshot doc;
  final Function food;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.00),
      child: Container(
        height: 130,
        width:MediaQuery.of(context).size.width,
        decoration: new BoxDecoration(
          boxShadow: const [
            BoxShadow(blurRadius:1,color: Colors.grey ),
          ],
          color: Colors.white,
          borderRadius: new BorderRadius.all(Radius.circular(7)),
        ),
        child: Row(
          textDirection: TextDirection.rtl,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.width,
              width: 180.0,
              child: imge.isEmpty ? Container(): Image.network(imge ,
                fit: BoxFit.fill,) ,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10,right: 10),
              child: Container(
                child: Column(
                  textDirection: TextDirection.rtl,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("$name_food" ,
                        style: TextStyle(
                          fontSize:18.00,
                          fontFamily: "URW-DIN-Arabic-Bold",
                        )),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right:75.0),
                      child: FlatButton(
                        onPressed: food,
                        child: Text("قبول الطلب" ,
                            style: TextStyle(
                              fontSize: 15,
                              color: Color(0xFFEE1939),
                              fontFamily: "URW-DIN-Arabic-Bold",
                            )) ,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
