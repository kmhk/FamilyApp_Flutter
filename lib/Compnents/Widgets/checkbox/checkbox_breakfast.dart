import 'package:flutter/material.dart';
class checkbox_breakfast extends StatefulWidget {
  Map<String, bool> values;
  checkbox_breakfast(this.values);

  @override
  _checkbox_breakfastState createState() => _checkbox_breakfastState();
}

class _checkbox_breakfastState extends State<checkbox_breakfast> {

  @override
  Widget build(BuildContext context) {
    return GridView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 4,),
      children: widget.values.keys.map((String key) {
        return IgnorePointer(
          child: CheckboxListTile(
            title: Text(key),
            activeColor: Colors.redAccent,
            value: widget.values[key],
            onChanged: (bool value) {
              setState(() {
                widget.values[key] = value;
              });
            },
          ),
        );
      }).toList(),
    );
  }
}