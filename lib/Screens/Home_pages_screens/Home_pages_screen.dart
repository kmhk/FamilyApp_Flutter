import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:family/Compnents/Careds/Cards_home_pages_screens/card_food.dart';
import 'package:family/Compnents/Widgets/FlatButton_wigets/FlatButton_medium.dart';
import 'package:family/Compnents/Widgets/RaisedButton_widgets/R_Medium_RaisedButton.dart';
import 'package:family/Compnents/Widgets/drawer/drawer.dart';
import 'package:family/Model/product_item.dart';
import 'package:family/Model/user_detail.dart';
import 'package:family/Services/families_service.dart';
import 'package:family/app.dart';
import 'package:flutter/material.dart';
import 'Add_product/Add_product.dart';
import 'Foode_screen/Delete_foode_screen.dart';
import 'Messages/Messages.dart';
import 'Products/Products.dart';
import 'Requests/Requests.dart';
import 'Special_request/Special_request.dart';
import 'Subscription/Subscription.dart';

class Home_pages_screen extends StatefulWidget {
  @override
  _Home_pages_screenState createState() => _Home_pages_screenState();
}

class _Home_pages_screenState extends State<Home_pages_screen> {
  @override
  void initState() {
    updateFamilyInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          drawer: StreamBuilder<QuerySnapshot>(
              stream: familiesService.getFamilyData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return drawer_(
                    name: snapshot.data.docs.first.data()['name'],
                    imageUrl: snapshot.data.docs.first.data()['imageUrl'],
                  );
                } else {
                  return Container();
                }
              }),
          body: SingleChildScrollView(
            child: Column(
              textDirection: TextDirection.rtl,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 50.0, right: 15.0, left: 15.0),
                  child: Row(
                    textDirection: TextDirection.rtl,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("اهلا و سهلا",
                          style: TextStyle(
                            fontSize: 23,
                            color: Colors.black,
                          )),
                      Spacer(),
                      Container(
                        height: 50,
                        width: 53,
                        decoration: new BoxDecoration(
                          boxShadow: const [],
                          color: Colors.white,
                          borderRadius:
                              new BorderRadius.all(Radius.circular(5)),
                        ),
                        child: Builder(
                          builder: (context) => IconButton(
                            icon: Icon(Icons.menu),
                            color: Colors.black,
                            iconSize: 36,
                            onPressed: () => Scaffold.of(context).openDrawer(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                StreamBuilder<QuerySnapshot>(
                    stream: familiesService.getFamilyData(),
                    builder: (context, snapshot) {
                      return name(
                        name_: snapshot.hasData
                            ? snapshot.data.docs.first.data()['name']
                            : "إسم المنتجة..",
                      );
                    }),
                Container(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, bottom: 20),
                    child: Row(
                      textDirection: TextDirection.rtl,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        R_Medium_RaisedButton(
                          text: "اضافة منتج",
                          press: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Add_product();
                            }));
                          },
                        ),
                        Spacer(),
                        R_Medium_RaisedButton(
                          text: "الطلبات الخاصة\nوالبوفيهات والاشتراكات",
                          press: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Special_request();
                            }));
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                StreamBuilder(
                  stream: productService
                      .getProductList(currentFamily.value['familyId']),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData &&
                        snapshot.data.docs.isNotEmpty) {
                      List<ProductItem> productItemList =
                          List<ProductItem>.from(snapshot.data.docs.map(
                              (x) => ProductItem.fromJson(x.data(), x.id)));
                      // categories products
                      List<ProductCategoryItem> listProductCategoryItem =
                          List();

                      productItemList.forEach((productItem) {
                        List<ProductCategoryItem> tempList =
                            listProductCategoryItem
                                .where((productCategory) =>
                                    productCategory.departmentName ==
                                    productItem.departmentName)
                                .toList();

                        if (tempList != null && tempList.length > 0) {
                          listProductCategoryItem.forEach((_productCategory) {
                            if (_productCategory.departmentName ==
                                productItem.departmentName) {
                              _productCategory.productList.add(productItem);
                            }
                          });
                        } else {
                          List<ProductItem> _productItem = List();
                          _productItem.add(productItem);
                          listProductCategoryItem.add(ProductCategoryItem(
                              departmentName: productItem.departmentName,
                              productList: _productItem));
                        }
                      });

                      return ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: listProductCategoryItem.length,
                          itemBuilder: (context, index) {
                            return Container(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: Container(
                                      height: 250.0,
                                      width: MediaQuery.of(context).size.width,
                                      color: Colors.white,
                                      child: Column(
                                        textDirection: TextDirection.rtl,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            child: Row(
                                              textDirection: TextDirection.rtl,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 20.0,
                                                          right: 24.0,
                                                          top: 15.0,
                                                          bottom: 25.0),
                                                  child: Text(
                                                      listProductCategoryItem[
                                                              index]
                                                          .departmentName,
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontFamily:
                                                              "URW-DIN-Arabic-Bold")),
                                                ),
                                                Spacer(),
                                                FlatButton_medium(
                                                  text: "المزيد",
                                                  press: () {
                                                    Navigator.push(context,
                                                        MaterialPageRoute(
                                                            builder: (context) {
                                                      return Products(
                                                          listProductItem:
                                                              listProductCategoryItem[
                                                                      index]
                                                                  .productList);
                                                    }));
                                                  },
                                                )
                                              ],
                                            ),
                                          ),
                                          SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                                textDirection:
                                                    TextDirection.rtl,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: getListOfProduct(
                                                    listProductCategoryItem[
                                                            index]
                                                        .productList)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          });
                    } else {
                      return Container();
                    }
                  },
                ),
              ],
            ),
          ),
          bottomNavigationBar: Container(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
                bottom: 10,
              ),
              child: Row(
                textDirection: TextDirection.rtl,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Container(
                  //   width: 120,
                  //   height: 49,
                  //   child: R_Medium_RaisedButton(
                  //     text: "الاشتراكات",
                  //     press:(){
                  //       Navigator.push(context,
                  //           MaterialPageRoute(builder: (context) {
                  //             return Subscription();
                  //           }));
                  //     },
                  //   ),
                  // ),
                  // Spacer(),
                  // Container(
                  //   width: 120,
                  //   height: 49,
                  //   child: R_Medium_RaisedButton(
                  //     text: "الطلبات",
                  //     press: () {
                  //       Navigator.push(context,
                  //           MaterialPageRoute(builder: (context) {
                  //         return Requests();
                  //       }));
                  //     },
                  //   ),
                  // ),

                  // Spacer(),
                  Container(
                    width: MediaQuery.of(context).size.width - 100,
                    height: 50,
                    child: R_Medium_RaisedButton(
                      text: "المراسلة",
                      press: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Messages();
                        }));
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void updateFamilyInfo() async {
    familiesService.getFamilyId();
  }

  List<Widget> getListOfProduct(List<ProductItem> productList) {
    List<Widget> productRow = List();

    for (int i = 0;
        i < (productList.length > 6 ? 6 : productList.length);
        i++) {}
    productList.forEach((element) {
      productRow.add(card_food(
        imge: element.imageUrl,
        name: currentFamily.value['name'],
        food: element.foodName,
        neighborhood: currentFamily.value['living'],
        price: element.price.toString(),
        rating: element.rating,
        type: element.sizeUnit,
        page_food: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return Delete_foode_screen(productItem: element);
          }));
        },
      ));
    });

    return productRow;
  }
}

class name extends StatelessWidget {
  const name({
    Key key,
    this.name_,
  }) : super(key: key);
  final String name_;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, bottom: 20),
      child: Text("$name_",
          style: TextStyle(
              fontSize: 26,
              color: Color(0xFF545151),
              fontFamily: "URW-DIN-Arabic-Bold")),
    );
  }
}
