import 'package:family/Compnents/Widgets/Text_widgets/mmedium_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class Textfield_time extends StatelessWidget {
  final TextEditingController fromController;
  final TextEditingController toController;
  const Textfield_time({
    Key key,this.fromController, this.toController
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("من",
            style: TextStyle(
                fontSize: 18,
                color: Color(0xFF333333)
            )),
        ),
        Container(
          height: 50.0,
          width: 128,
          child:TextField(
            controller: fromController,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            inputFormatters: [new WhitelistingTextInputFormatter(RegExp("[0-9]"))],
            style: TextStyle(
                fontSize: 18.0,

               ),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: "ساعه" ,
              contentPadding:
              const EdgeInsets.only(
                  left: 14.0,
                  bottom: 8.0,
                  top: 8.0,
                  right: 14.0
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(color: Color(0xFF333333).withOpacity(0.1), width: 1.0),
              ),
              enabledBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(color: Color(0xFF333333).withOpacity(0.1), width: 1.0),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("الى",
              style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF333333)
              )),
        ),
        Container(
          height: 50.0,
          width: 128,
          child:TextField(
            controller: toController,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            inputFormatters: [new WhitelistingTextInputFormatter(RegExp("[0-9]"))],
            style: TextStyle(
              fontSize: 18.0,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: "5 ساعات" ,
              contentPadding:
              const EdgeInsets.only(
                  left: 14.0,
                  bottom: 8.0,
                  top: 8.0,
                  right: 14.0
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(color: Color(0xFF333333).withOpacity(0.1), width: 1.0),
              ),
              enabledBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(color: Color(0xFF333333).withOpacity(0.1), width: 1.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}