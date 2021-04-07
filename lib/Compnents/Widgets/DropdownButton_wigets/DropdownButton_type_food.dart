import 'package:flutter/material.dart';

class DropdownButton_type_food extends StatefulWidget {
  Function(String) callBack;
  String defaultValue;
  DropdownButton_type_food({this.callBack, this.defaultValue});
  @override
  _DropdownButton_type_foodState createState() => _DropdownButton_type_foodState();
}

class _DropdownButton_type_foodState extends State<DropdownButton_type_food> {
  String a;
  @override
  void initState() {
    super.initState();
    a = widget.defaultValue??null;
  }

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
                        "بارد",
                        style:TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        )
                    ),
                  ),
                ),
                iconSize: 32,
                iconDisabledColor: Colors.black,
                value: a,
                items: <String>['بارد', 'حار']
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
                    a = value;
                  });
                  widget.callBack(value)?.call();
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}