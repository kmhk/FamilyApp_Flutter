import 'dart:io';

import 'package:flutter/material.dart';
class Circl_imge extends StatelessWidget {
  const Circl_imge({
    Key key, this.Imge, this.callback, this.pickedImge
  }) : super(key: key);
  final String Imge;
  final File pickedImge;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius:65.0,
      backgroundImage: pickedImge!=null ? FileImage(pickedImge) : AssetImage(Imge),
      child: Padding(
        padding: const EdgeInsets.only(top:100,left:80),
        child: FloatingActionButton(
          backgroundColor:  Colors.white,
          foregroundColor: Colors.black,
          mini: true,
          onPressed: callback,
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}