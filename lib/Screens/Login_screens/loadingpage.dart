import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Loadingpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white.withOpacity(0.8),
        ),
        child: CupertinoActivityIndicator(),
      ),
    );
  }
}