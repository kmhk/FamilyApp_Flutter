import 'package:flutter/material.dart';
class Container_admin extends StatelessWidget {
  const Container_admin({
    Key key, this.titile, this.add, this.Show,
  }) : super(key: key);
final String titile ;
final Function add , Show;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.00, bottom: 30.00),
      child: Container(
          width:MediaQuery.of(context).size.width,
          height: 170,
          decoration: new BoxDecoration(
            boxShadow: const [
              BoxShadow(blurRadius:1,color: Colors.grey ),
            ],
            color: Colors.white,
            borderRadius: new BorderRadius.all(Radius.circular(20)),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right:14,top: 30),
                child: Text("$titile",
                    style: TextStyle(
                      fontSize: 26,
                    )),
              ),
              Row( textDirection: TextDirection.rtl,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 37 ,right: 32,),
                    child: Container(
                      height: 51,
                      width: 115,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(7.0))),
                        color: Color(0xFFEE1939),
                        child: Text(
                          'اضافة',
                          style: TextStyle(
                            fontFamily: "URW-DIN-Arabic-Bold",
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: add,
                      ),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(top: 37 ,left: 32,),
                    child: Container(
                      height: 51,
                      width: 115,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(7.0))),
                        color: Color(0xFFEE1939),
                        child: Text(
                          'عرض',
                          style: TextStyle(
                            fontFamily: "URW-DIN-Arabic-Bold",
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: Show,
                      ),
                    ),
                  ),
                ],
              )
            ],
          )
      ),
    );
  }
}