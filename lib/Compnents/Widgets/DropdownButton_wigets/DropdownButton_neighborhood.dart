import 'package:flutter/material.dart';
class DropdownButton_neighborhood extends StatefulWidget {
  @override
  _DropdownButton_neighborhoodState createState() => _DropdownButton_neighborhoodState();
}

class _DropdownButton_neighborhoodState extends State<DropdownButton_neighborhood> {
  @override
  Widget build(BuildContext context) {
    String b;
    Widget build(BuildContext context) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          width:  MediaQuery.of(context).size.width,
          decoration: new BoxDecoration(
            boxShadow: const [
              BoxShadow(blurRadius:2,color: Colors.white60),
            ],
            color: Colors.white,
            borderRadius: new BorderRadius.all(Radius.circular(7)),
          ),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Padding(
              padding: const EdgeInsets.only(left:10,right: 10),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  icon:  Icon(Icons.expand_more),
                  hint: Align(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Text(
                          "اسم المدينة",
                          style:TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          )
                      ),
                    ),
                  ),
                  iconSize: 32,
                  iconDisabledColor: Colors.black,
                  value: b,
                  items: <String>['معجنات', 'شعبيات', 'حلويات', 'مشروبات','مشروبات','مقليات']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: Text(value,textAlign: TextAlign.start,)),
                      ),
                    );
                  }).toList(),
                  elevation: 0,
                  onChanged: (String value) {
                    setState(() {
                      b = value;
                    });
                  },
                ),
              ),
            ),
          ),
        ),
      );
    }
  }
}