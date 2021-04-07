import 'package:flutter/material.dart';
class card_food extends StatelessWidget {
  const card_food({
    Key key, this.page_food, this.name, this.food, this.rating, this.price, this.type, this.neighborhood, this.imge,
  }) : super(key: key);
  final Function page_food;
  final String name , food, rating,price,type,neighborhood,imge;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(right: 25),
      child: InkWell(
        onTap: page_food,
        child: Container(
          width: 200.0,
          height: 160,
          decoration: new BoxDecoration(
            border: Border.all(
              color:Colors.grey,
              style: BorderStyle.solid,
              width: 1.0,
            ),
                color: Colors.white,
                borderRadius: new BorderRadius.all(Radius.circular(7)),
              ),
            child: Column(
                    textDirection: TextDirection.rtl,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        decoration: new BoxDecoration(
                          borderRadius: new BorderRadius.only(topLeft:Radius.circular(7), topRight: Radius.circular(7) ),
                        ),
                        width: MediaQuery.of(context).size.width,
                        height: 76.0,
                        child: Image.network(imge,
                          fit: BoxFit.fill,
                        ),),
                      Padding(
                        padding: const EdgeInsets.only(right: 8,top: 10,left:20),
                        child: Container(
                          child:  Column(
                            textDirection: TextDirection.rtl,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                textDirection: TextDirection.rtl,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("$food",
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Color(0xFFEE1939),
                                          fontFamily: "URW-DIN-Arabic-Bold"
                                      )),
                                  Spacer(),
                                  Icon(
                                    Icons.gps_fixed,
                                    color: Colors.black,
                                    size: 14.0,
                                  ),
                                  Text("$neighborhood",
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.black,
                                          fontFamily: "URW-DIN-Arabic-Bold"
                                      )),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5,bottom: 10),
                                child: Text("$name",
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        color: Color(0xFF817F7F),
                                        fontFamily: "Careem"
                                    )),
                              ),
                              Row(
                                textDirection: TextDirection.rtl,

                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text("$priceريال ",
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.black,
                                          fontFamily: "Careem",
                                        )),
                                  ),
                                  Text("/ $type",
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.black,
                                          fontFamily: "Careem"
                                      )),
                                  Spacer(),
                                 Text("$rating",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black,
                                          fontFamily: "URW-DIN-Arabic-Bold",
                                        )),

                                  Icon(
                                    Icons.star,
                                    color:Colors.amber,
                                    size: 25.0,
                                  ),
                                ],
                              ),
                            ],
                          ) ,
                        ),
                      ),
                    ],
                  ),
        ),
      ),
    );
  }
}