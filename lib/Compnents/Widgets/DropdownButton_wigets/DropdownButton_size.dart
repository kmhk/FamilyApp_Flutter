import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DropdownButton_size extends StatefulWidget {
  final TextEditingController controller;
  Function(String) callBack;
  String defaultUnit;
  DropdownButton_size({this.controller, this.callBack, this.defaultUnit});
  @override
  _DropdownButton_sizeState createState() => _DropdownButton_sizeState();
}

class _DropdownButton_sizeState extends State<DropdownButton_size> {
  String b;

  @override
  void initState() {
    super.initState();
    b = widget.defaultUnit ?? null;
  }

  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Row(
        children: [
          Container(
            width: 220,
            height: 50.0,
            child: TextField(
              controller: widget.controller,
              textAlign: TextAlign.right,
              keyboardType: TextInputType.number,
              inputFormatters: [
                new WhitelistingTextInputFormatter(RegExp("[0-9]"))
              ],
              style: TextStyle(
                fontSize: 18.0,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "1",
                contentPadding: const EdgeInsets.only(
                    left: 14.0, bottom: 8.0, top: 8.0, right: 14.0),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  borderSide: BorderSide(
                      color: Color(0xFF333333).withOpacity(0.1), width: 1.0),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  borderSide: BorderSide(
                      color: Color(0xFF333333).withOpacity(0.1), width: 1.0),
                ),
              ),
            ),
          ),
          Spacer(),
          Container(
            width: 120,
            decoration: new BoxDecoration(
              boxShadow: const [
                BoxShadow(blurRadius: 2, color: Colors.white60),
              ],
              color: Colors.white,
              borderRadius: new BorderRadius.all(Radius.circular(7)),
            ),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      icon: Icon(Icons.expand_more),
                      hint: Align(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Text("كيلو",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              )),
                        ),
                      ),
                      iconSize: 32,
                      iconDisabledColor: Colors.black,
                      value: b,
                      items: <String>['كيلو', 'حبة', 'لتر', 'شخص']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: Directionality(
                                textDirection: TextDirection.rtl,
                                child: Text(
                                  value,
                                  textAlign: TextAlign.start,
                                )),
                          ),
                        );
                      }).toList(),
                      elevation: 0,
                      onChanged: (String value) {
                        setState(() {
                          b = value;
                        });
                        widget.callBack(value)?.call();
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
