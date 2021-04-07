import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:family/app.dart';
import 'package:flutter/material.dart';
class DropdownButton_city extends StatefulWidget {
  final Function(String) callBack;
  final String defCity;
  final String city;
  bool isDistrict;
  DropdownButton_city({this.callBack,this.defCity, this.city, this.isDistrict= false});

  @override
  _DropdownButton_cityState createState() => _DropdownButton_cityState();
}

class _DropdownButton_cityState extends State<DropdownButton_city> {
  String a;

  @override
  void initState() {
    super.initState();

    a = widget.defCity;
  }

  Widget build(BuildContext context) {
    if(widget.isDistrict && widget.defCity==null) {
      a=widget.defCity;
    }
    return FutureBuilder(
      future: widget.isDistrict ? districtService.cityDistrictList(widget.city) : citiesService.citiesList(),
      builder: (context, snapshot) {
        if(snapshot.hasData){
          List<String> citiesList = [];
          List<DocumentSnapshot> docs = snapshot.data.docs;
          for(int i = 0;i<docs.length;i++){
            if(!widget.isDistrict) {
              citiesList.add(docs[i].data()['city']);
            } else {
              citiesList.add(docs[i].data()['district']);
            }
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
                          padding: const EdgeInsets.only(right:3),
                          child: Text(
                            // String,
                              " المدينة",
                              style:TextStyle(
                                color: Color(0xFF333333),
                                fontSize: 18,
                              )
                          ),
                        ),
                      ),
                      iconSize: 32,
                      iconDisabledColor: Colors.black,
                      value: a,
                      items: citiesList
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
        }else{
          return Container();
        }
      },
    );
  }
}