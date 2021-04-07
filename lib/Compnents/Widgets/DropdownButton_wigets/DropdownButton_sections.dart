import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:family/app.dart';
import 'package:flutter/material.dart';
class DropdownButton_sections extends StatefulWidget {
  final Function(String) callBack;
  String defaultValue;
  DropdownButton_sections({this.callBack, this.defaultValue});
  @override
  _DropdownButton_sectionsState createState() => _DropdownButton_sectionsState();
}

class _DropdownButton_sectionsState extends State<DropdownButton_sections> {
  String b;

  @override
  void initState() {
    super.initState();
    b = widget.defaultValue??null;
  }

  Widget build(BuildContext context) {
    return FutureBuilder(
        future: departmentService.departmentsList(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            List<String> departmentList = [];
            List<DocumentSnapshot> docs = snapshot.data.docs;
            for(int i = 0;i<docs.length;i++){
              departmentList.add(docs[i].data()['department']);
            }
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
                            padding: const EdgeInsets.only(right: 3),
                            child: Text(
                                "القسم",
                                style:TextStyle(
                                  color: Color(0xff333333),
                                  fontSize: 18,
                                )
                            ),
                          ),
                        ),
                        iconSize: 32,
                        iconDisabledColor: Colors.black,
                        value: b,
                        items: departmentList.map<DropdownMenuItem<String>>((String value) {
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
                          widget.callBack(value)?.call();

                        },
                      ),
                    ),
                  ),
                ),
              ),
            );
          }else{
            return Container();
          }
        }
    );
  }
}