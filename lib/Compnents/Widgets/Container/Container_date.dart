import 'package:family/Compnents/Widgets/Text_widgets/mmedium_text.dart';
import 'package:flutter/material.dart';
class Container_date extends StatefulWidget {
  DateTime fromDateTime;
  DateTime toDateTime;

  Container_date(this.fromDateTime, this.toDateTime);

  @override
  _Container_dateState createState() => _Container_dateState();
}

class _Container_dateState extends State<Container_date> {
  DateTime _dateTime;
  DateTime _todateTime;

  @override
  void initState() {
    super.initState();
    _dateTime = widget.fromDateTime;
    _todateTime = widget.toDateTime;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Row(
        textDirection: TextDirection.rtl,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("من",
              style: TextStyle(
                fontSize:20,
                color: Color(0xFF333333),
              )),
           Spacer(),
           Container(
              width: 124,
              height: 32,
              decoration: new BoxDecoration(
                boxShadow: const [
                ],
                color: Colors.white,
                borderRadius: new BorderRadius.all(Radius.circular(5)),
              ),
              child: InkWell(
                onTap: ()  {
                  showDatePicker(
                    context: context,
                    initialDate: _dateTime == null ? DateTime.now() : _dateTime,
                    firstDate: DateTime(2001),
                    lastDate: DateTime(2021),
                    textDirection: TextDirection.ltr,
                  ).then((date) {
                    setState(() {
                      _dateTime = date;
                    });
                  });
                },

                child: Center(
                  child: Text('$_dateTime',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF333333),
                      )),
                ),
              ),
            ),
          Spacer(),
          Text("الى",
              style: TextStyle(
                fontSize: 20,
                color: Color(0xFF333333),
              )),
          Spacer(),
         Container(
              width: 124,
             height: 32,
            decoration: new BoxDecoration(
                boxShadow: const [
                ],
                color: Colors.white,
                borderRadius: new BorderRadius.all(Radius.circular(5)),
              ),
              child: InkWell(
                onTap: ()  {
                  showDatePicker(
                    context: context,
                    initialDate: _todateTime == null ? DateTime.now() : _dateTime,
                    firstDate: DateTime(2001),
                    lastDate: DateTime(2021),
                    textDirection: TextDirection.ltr,
                  ).then((date) {
                    setState(() {
                      _todateTime = date;
                    });
                  });
                },

                child: Center(
                  child: Text("$_todateTime",
                     textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF333333),

                      )),
                ),
              ),
            ),
        ],
      ),
    );
  }
}



