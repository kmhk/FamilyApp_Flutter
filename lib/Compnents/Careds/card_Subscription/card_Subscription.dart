import 'package:flutter/material.dart';

class card_Subscription extends StatelessWidget {
  const card_Subscription({
    Key key, this.name, this.page, this.type,
  }) : super(key: key);
final String name ;
final String type ;
final Function page;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: page,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Container(
          width:MediaQuery.of(context).size.width,
          decoration: new BoxDecoration(
            boxShadow: const [
              BoxShadow(blurRadius:1,color: Colors.grey ),
            ],
            color: Colors.white,
            borderRadius: new BorderRadius.all(Radius.circular(7)),
          ),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20,top: 10,right: 15,left: 15),
            child:
                Row(
                  children: [
                    Text(type,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        )),
                    Spacer(),
                    Text("$name",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        )),
                  ],
                ),
          ),
        ),
      ),
    );
  }
}
