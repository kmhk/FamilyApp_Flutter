import 'package:family/Compnents/Careds/Card_Products/Card_Products.dart';
import 'package:family/Compnents/Widgets/IconButton_widgets/Back_IconButton.dart';
import 'package:family/Model/product_item.dart';
import 'package:family/Screens/Home_pages_screens/Foode_screen/Delete_foode_screen.dart';
import 'package:family/Services/families_service.dart';
import 'package:flutter/material.dart';
class Products extends StatefulWidget {
  List<ProductItem> listProductItem;

  Products({this.listProductItem});
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body:SingleChildScrollView(
          child:  Container(
            child: Column(
              children: getListOfProducts(widget.listProductItem)
            ),
          ),
        ) ,
      ),
    );
  }

  List<Widget> getListOfProducts(List<ProductItem> listProductItem) {
    List<Widget> listWidget = List();

    listWidget.add(Padding(
      padding: const EdgeInsets.only(top: 50.0,right: 10.0, left: 30.0, bottom: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Directionality(
              textDirection: TextDirection.ltr,
              child: Back_IconButton()),
          Padding(
            padding: const EdgeInsets.only(right:70.0, bottom: 40, top: 10),
            child: Text("المنتجات",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  color: Color(0xFF333333),
                )),
          )
        ],
      ),
    ));

    listProductItem.forEach((element) {
      listWidget.add(Card_Products(
        imge:element.imageUrl,
        name_food: element.foodName,
        name: currentFamily.value['name'],
        date: element.creationDate,
        food: (){
          Navigator.push(context,
              MaterialPageRoute(builder: (context) {
                return Delete_foode_screen(productItem: element);
              }));
        },
      ));
    });
    return listWidget;
  }
}
