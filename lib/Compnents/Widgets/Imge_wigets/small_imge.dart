import 'dart:io';

import 'package:flutter/material.dart';

// import 'package:multi_image_picker/multi_image_picker.dart';
class small_imge extends StatelessWidget {
  const small_imge(
      {Key key,
      this.Imge,
      this.assetImg,
      this.networkImage,
      this.deleteCallBack})
      : super(key: key);
  final String Imge;
  final String networkImage;
  final File assetImg;
  final Function deleteCallBack;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Stack(
        children: [
          Container(
              width: 68,
              height: 91,
              decoration: new BoxDecoration(
                boxShadow: const [
                  BoxShadow(blurRadius: 1, color: Colors.grey),
                ],
                color: Colors.white,
                borderRadius: new BorderRadius.all(Radius.circular(4)),
              ),
              child: networkImage != null
                  ? Image.network(
                      networkImage,
                      fit: BoxFit.fill,
                    )
                  : Container() //: (assetImg != null ? AssetThumb(asset: assetImg, width:68, height:91,) : Image.asset(Imge,
              //// fit: BoxFit.fill,
              // )),
              ),
          Positioned(
              child: InkWell(
                  onTap: deleteCallBack,
                  child: Icon(Icons.delete, color: Color(0xFFEE1939))))
        ],
      ),
    );
  }
}
