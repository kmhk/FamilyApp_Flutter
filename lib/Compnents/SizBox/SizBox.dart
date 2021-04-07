import 'package:flutter/material.dart';
class SizBox extends StatelessWidget {
  const SizBox({
    Key key, this.h, this.w,
  }) : super(key: key);
  final double h;
  final double w;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:h,
      width: w,
    );
  }
}