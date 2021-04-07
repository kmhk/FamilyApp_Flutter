import 'package:flutter/material.dart'
;class Imge_wigets extends StatelessWidget {
  const Imge_wigets({
    Key key, this.Imge,
  }) : super(key: key);
  final String Imge;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 400.0,
        height: 250.0,
        child: Image.asset(Imge ,
       ),),
    );
  }
}