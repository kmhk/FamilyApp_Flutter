import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:family/Compnents/SizBox/SizBox.dart';
import 'package:family/Compnents/Widgets/IconButton_widgets/Back_IconButton.dart';
import 'package:family/Compnents/Widgets/RaisedButton_widgets/Large_RaisedButton.dart';
import 'package:family/Model/product_item.dart';
import 'package:family/Screens/Home_pages_screens/Add_product/Edit_product.dart';
import 'package:flutter/material.dart';

import '../../../app.dart';

class Delete_foode_screen extends StatefulWidget {
  ProductItem productItem;
  Delete_foode_screen({this.productItem});

  @override
  _Delete_foode_screenState createState() => _Delete_foode_screenState();
}

class _Delete_foode_screenState extends State<Delete_foode_screen> {
  delete(BuildContext context, String docId) async {
    TextEditingController customcontroller = TextEditingController();
    await productService.removeProduct(docId);

    return await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Container(
                  height: 100,
                  child: Center(
                    child: Text('تم ارسال حذف المنتج بنجاح',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        )),
                  )));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              top: 50.0, right: 5.0, left: 5, bottom: 10.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              textDirection: TextDirection.rtl,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  textDirection: TextDirection.rtl,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Back_IconButton(),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 50.00, top: 5.00, bottom: 20.00),
                      child: food_name(
                        food: widget.productItem?.foodName,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: MediaQuery.of(context).size.height - 240,
                  child: ListView(
                    children: [
                      Container(
                        child: Column(
                          textDirection: TextDirection.rtl,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            num_sharing(
                              num: widget.productItem?.noOfShare.toString(),
                            ),
                            Container(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: getProductImageListview(
                                      widget.productItem?.imageList ?? []),
                                ),
                              ),
                            ),
                            Ingredients(
                              date: widget.productItem?.creationDate ?? "",
                              Ingredient: widget.productItem?.description ?? "",
                              num_calories:
                                  widget.productItem?.calories?.toString() ??
                                      "",
                              num_requests:
                                  widget.productItem?.noOfOrder?.toString() ??
                                      "",
                              time: widget.productItem?.preparationTo
                                      ?.toString() ??
                                  "",
                              Views: widget.productItem?.noOfView?.toString() ??
                                  "",
                              rating:
                                  widget.productItem?.noOfRating?.toString() ??
                                      "",
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 30, right: 10, bottom: 30),
                              child: Text("التعليقات",
                                  style: TextStyle(
                                      fontSize: 22.0,
                                      fontFamily: "URW-DIN-Arabic-Bold")),
                            ),
                            StreamBuilder(
                                stream: productService.commentsOfProduct(
                                    widget.productItem.docId),
                                builder: (context, AsyncSnapshot snapshot) {
                                  if (snapshot.hasData &&
                                      snapshot?.data != null) {
                                    List<DocumentSnapshot> comments =
                                        snapshot.data.docs;

                                    return ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: comments.length,
                                        itemBuilder: (context, index) {
                                          DocumentSnapshot commentDoc =
                                              comments[index];
                                          return comment(
                                            name: commentDoc.data()["userName"],
                                            comments:
                                                commentDoc.data()["comment"],
                                          );
                                        });
                                  } else {
                                    return Container();
                                  }
                                }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 178.0,
                        child: Large_RaisedButton(
                          text: "حذف ",
                          press: () async {
                            await delete(context, widget.productItem.docId);
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                      Spacer(),
                      Container(
                        width: 178.0,
                        child: Large_RaisedButton(
                          text: "تعديل ",
                          press: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Edit_product(
                                  productItem: widget.productItem);
                            }));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  getProductImageListview(List<String> list) {
    List<Widget> listWidget = List();
    list.forEach((element) {
      listWidget.add(imge(
        food: element,
      ));
    });
    return listWidget;
  }
}

class food_name extends StatelessWidget {
  const food_name({
    Key key,
    this.food,
  }) : super(key: key);
  final String food;
  @override
  Widget build(BuildContext context) {
    return Text(
      "$food",
      style: TextStyle(fontSize: 30.00),
    );
  }
}

class comment extends StatelessWidget {
  const comment({
    Key key,
    this.comments,
    this.name,
  }) : super(key: key);
  final comments, name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0, left: 15),
      child: Container(
        child: Container(
          child: Column(
            textDirection: TextDirection.rtl,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: new BoxDecoration(
                    boxShadow: const [
                      BoxShadow(blurRadius: 1, color: Colors.grey),
                    ],
                    color: Colors.white,
                    borderRadius: new BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 10, right: 20, left: 10, bottom: 20),
                    child: Column(
                      textDirection: TextDirection.rtl,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          textDirection: TextDirection.rtl,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text("$name",
                                  style: TextStyle(
                                    fontSize: 22,
                                  )),
                            ),
                            Spacer(),
                            FlatButton(
                              child: Text("ابلاغ",
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontFamily: "URW-DIN-Arabic-Bold",
                                    color: Color(0xFFEE1939),
                                  )),
                              onPressed: () {},
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Text("$comments",
                              style: TextStyle(
                                fontSize: 16,
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Ingredients extends StatelessWidget {
  const Ingredients({
    Key key,
    this.num_requests,
    this.Views,
    this.date,
    this.time,
    this.Ingredient,
    this.num_calories,
    this.rating,
  }) : super(key: key);
  final String num_requests,
      Views,
      date,
      time,
      Ingredient,
      num_calories,
      rating;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 50,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  textDirection: TextDirection.rtl,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("عدد الطلبات",
                        style: TextStyle(
                          fontSize: 13,
                          fontFamily: "URW-DIN-Arabic-Bold",
                        )),
                    Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Text("$num_requests",
                          style: TextStyle(
                            fontSize: 13,
                            fontFamily: "URW-DIN-Arabic-Bold",
                            color: Color(0xFFEE1939),
                          )),
                    ),
                    Spacer(),
                    Text("عدد المشاهدات",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        )),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 5,
                      ),
                      child: Text("$Views",
                          style: TextStyle(
                            fontSize: 13,
                            fontFamily: "URW-DIN-Arabic-Bold",
                            color: Color(0xFFEE1939),
                          )),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 5.0),
              child: Row(
                textDirection: TextDirection.rtl,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("تاريخ الاضافة",
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: "URW-DIN-Arabic-Bold",
                      )),
                  Padding(
                    padding: const EdgeInsets.only(right: 5, bottom: 40),
                    child: Text("$date",
                        style: TextStyle(
                          fontSize: 13,
                          fontFamily: "URW-DIN-Arabic-Bold",
                          color: Color(0xFFEE1939),
                        )),
                  ),
                  Spacer(),
                  Text("عدد التقيمات",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 5,
                    ),
                    child: Text("$rating",
                        style: TextStyle(
                          fontSize: 13,
                          fontFamily: "URW-DIN-Arabic-Bold",
                          color: Color(0xFFEE1939),
                        )),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: new BoxDecoration(
                boxShadow: const [
                  BoxShadow(blurRadius: 1, color: Colors.grey),
                ],
                color: Colors.white,
                borderRadius: new BorderRadius.all(Radius.circular(10)),
              ),
              child: Container(
                margin: EdgeInsets.only(
                    bottom: 15.0, top: 15.0, right: 20.0, left: 20.0),
                child: Column(
                  textDirection: TextDirection.rtl,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("مكونات المنتج",
                        style: TextStyle(
                            fontSize: 22.0, fontFamily: "URW-DIN-Arabic-Bold")),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 15, bottom: 70, left: 70),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Text("$Ingredient",
                            style: TextStyle(
                                fontSize: 13,
                                color: Color(0xFFEE1939),
                                fontFamily: "URW-DIN-Arabic-Bold")),
                      ),
                    ),
                    Row(
                      textDirection: TextDirection.rtl,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          textDirection: TextDirection.rtl,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("السعرات الحرارية",
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontFamily: "URW-DIN-Arabic-Bold")),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Row(
                                children: [
                                  Text("سعره حرارية",
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Color(0xFFEE1939),
                                        fontWeight: FontWeight.bold,
                                      )),
                                  Text("$num_calories",
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Color(0xFFEE1939),
                                        fontWeight: FontWeight.bold,
                                      )),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizBox(
                          w: 50,
                        ),
                        Column(
                          textDirection: TextDirection.rtl,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("مدة التجهز",
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontFamily: "URW-DIN-Arabic-Bold")),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Row(
                                children: [
                                  Text("ساعة",
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Color(0xFFEE1939),
                                        fontWeight: FontWeight.bold,
                                      )),
                                  Text("$time",
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Color(0xFFEE1939),
                                        fontWeight: FontWeight.bold,
                                      )),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class imge extends StatelessWidget {
  const imge({
    Key key,
    this.food,
  }) : super(key: key);
  final String food;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, bottom: 20),
      child: Container(
        width: 220.0,
        height: 190.0,
        decoration: new BoxDecoration(
          boxShadow: const [
            BoxShadow(blurRadius: 1, color: Colors.grey),
          ],
          color: Colors.white,
          borderRadius: new BorderRadius.all(Radius.circular(15)),
        ),
        child: Image.network(food, fit: BoxFit.fill),
      ),
    );
  }
}

class num_sharing extends StatelessWidget {
  const num_sharing({
    Key key,
    this.num,
  }) : super(key: key);
  final String num;

  @override
  Widget build(BuildContext context) {
    return Column(
      textDirection: TextDirection.rtl,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 15, left: 20),
          child: Container(
            height: 50,
            child: Row(
              textDirection: TextDirection.rtl,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("صور الوجبة",
                    style: TextStyle(
                      fontSize: 22,
                      fontFamily: "URW-DIN-Arabic-Bold",
                    )),
                Spacer(),
                Text("عدد المشاركات",
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: "URW-DIN-Arabic-Bold",
                    )),
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Text("$num",
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: "URW-DIN-Arabic-Bold",
                        color: Color(0xFFEE1939),
                      )),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
