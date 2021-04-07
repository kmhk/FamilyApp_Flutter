import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:family/Compnents/SizBox/SizBox.dart';
import 'package:family/Compnents/Widgets/DropdownButton_wigets/DropdownButton_sections.dart';
import 'package:family/Compnents/Widgets/DropdownButton_wigets/DropdownButton_size.dart';
import 'package:family/Compnents/Widgets/DropdownButton_wigets/DropdownButton_type_food.dart';
import 'package:family/Compnents/Widgets/IconButton_widgets/Back_IconButton.dart';
import 'package:family/Compnents/Widgets/Imge_wigets/small_imge.dart';
import 'package:family/Compnents/Widgets/RaisedButton_widgets/Large_RaisedButton.dart';
import 'package:family/Compnents/Widgets/TextFild_wigets/Textfield_Advertising.dart';
import 'package:family/Compnents/Widgets/TextFild_wigets/Textfield_food.dart';
import 'package:family/Compnents/Widgets/TextFild_wigets/Textfield_price.dart';
import 'package:family/Compnents/Widgets/TextFild_wigets/Textfield_pricee.dart';
import 'package:family/Compnents/Widgets/TextFild_wigets/Textfield_time.dart';
import 'package:family/Compnents/Widgets/Text_widgets/R_medium.dart';
import 'package:family/Compnents/Widgets/Text_widgets/medium_text.dart';
import 'package:family/Compnents/Widgets/Text_widgets/mmedium_text.dart';
import 'package:family/Model/product_item.dart';
import 'package:family/Screens/Login_screens/loadingpage.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_absolute_path/flutter_absolute_path.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:multi_image_picker/multi_image_picker.dart';

import '../../../app.dart';

class Edit_product extends StatefulWidget {
  ProductItem productItem;
  Edit_product({this.productItem});

  @override
  _Edit_productState createState() => _Edit_productState();
}

class _Edit_productState extends State<Edit_product> {
  bool loading = false;
  List<File> listProductAssImages = [];
  List<File> listProductVideos = [];
  String selectedDepartment;
  String selectedProductStatus;
  String selectedSizeUnit = "كيلو";
  TextEditingController productNameController;
  TextEditingController productDetailController;
  TextEditingController productCaloriesController;
  TextEditingController productSizeController;
  TextEditingController productDiscountController;
  TextEditingController productPriceController;
  TextEditingController productDepositController;
  TextEditingController productDeliveryCostController;
  TextEditingController fromPrepareController;
  TextEditingController toPrepareController;

  Modify(BuildContext context) {
    TextEditingController customcontroller = TextEditingController();

    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Container(
                  height: 100,
                  child: Center(
                    child: Text("تم تعديل طلبك بنجاح",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        )),
                  )));
        });
  }

  @override
  void initState() {
    super.initState();
    print(widget.productItem.docId);
    b = widget.productItem.readyForPickUp;
    a = widget.productItem.intendedForVegetarians;
    selectedDepartment = widget.productItem.departmentName;
    selectedProductStatus = widget.productItem.status;
    productNameController =
        TextEditingController(text: widget.productItem.foodName);
    productDetailController =
        TextEditingController(text: widget.productItem.description);
    productCaloriesController =
        TextEditingController(text: widget.productItem.calories.toString());
    productSizeController =
        TextEditingController(text: widget.productItem.size);
    productDiscountController =
        TextEditingController(text: widget.productItem.discount.toString());
    productPriceController =
        TextEditingController(text: widget.productItem.price.toString());
    productDepositController =
        TextEditingController(text: widget.productItem.deposit.toString());
    productDeliveryCostController =
        TextEditingController(text: widget.productItem.deliveryCost.toString());
    fromPrepareController = TextEditingController(
        text: widget.productItem.preparationFrom.toString());
    toPrepareController = TextEditingController(
        text: widget.productItem.preparationTo.toString());
  }

  @override
  bool b = false;
  bool a = false;
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 50.0, right: 30.0, left: 30.0, bottom: 10.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Directionality(
                              textDirection: TextDirection.ltr,
                              child: Back_IconButton()),
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 40.0, bottom: 10),
                            child: medium_text(text: "تعديل المنتج"),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          mmedium(text: "اسم المنتج"),
                          R_medium(
                            text: "*",
                          ),
                        ],
                      ),
                      Textfield_food(controller: productNameController),
                      Row(
                        children: [
                          mmedium(text: "القسم"),
                          R_medium(
                            text: "*",
                          ),
                        ],
                      ),
                      DropdownButton_sections(
                        callBack: (value) {
                          selectedDepartment = value;
                          setState(() {});
                        },
                        defaultValue: widget.productItem.departmentName,
                      ),
                      Row(
                        children: [
                          mmedium(text: "الصور"),
                          // R_medium(
                          //   text: "*",
                          // ),
                        ],
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: getListOfImages(),
                        ),
                      ),
                      Row(
                        children: [
                          mmedium(text: "الفديو"),
                          // R_medium(
                          //   text: "*",
                          // ),
                        ],
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: getListOfVideos()),
                      ),
                      Row(
                        children: [
                          mmedium(text: "وصف المنتج"),
                          R_medium(
                            text: "*",
                          ),
                        ],
                      ),
                      Textfield_Advertising(
                          controller: productDetailController),
                      Row(
                        children: [
                          mmedium(text: "حالة المنتج"),
                          R_medium(
                            text: "*",
                          ),
                        ],
                      ),
                      DropdownButton_type_food(
                        callBack: (value) {
                          selectedProductStatus = value;
                          setState(() {});
                        },
                        defaultValue: widget.productItem.status,
                      ),
                      Row(
                        children: [
                          mmedium(text: "الحجم"),
                          R_medium(
                            text: "*",
                          ),
                        ],
                      ),
                      DropdownButton_size(
                        controller: productSizeController,
                        callBack: (value) {
                          selectedSizeUnit = value;
                          setState(() {});
                        },
                      ),
                      Row(
                        children: [
                          mmedium(text: "سعر المنتج"),
                          R_medium(
                            text: "*",
                          ),
                        ],
                      ),
                      Textfield_price(controller: productPriceController),
                      mmedium(text: "مبلغ العربون"),
                      Textfield_pricee(controller: productDepositController),
                      Container(
                        margin: const EdgeInsets.only(top: 30, bottom: 30),
                        padding: const EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.grey.withOpacity(0.6), width: 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("جاهز للاستلام(جاهز)",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xFF333333),
                                      )),
                                ),
                                Spacer(),
                                Switch(
                                  value: b,
                                  onChanged: (value) {
                                    setState(() {
                                      b = value;
                                      print(b);
                                    });
                                  },
                                  activeColor: Color(0xFFEE1939),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                mmedium(text: "مدة التجهيز"),
                                R_medium(
                                  text: "*",
                                ),
                              ],
                            ),
                            Textfield_time(
                                fromController: fromPrepareController,
                                toController: toPrepareController),
                          ],
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("مخصص للنباتين",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xFF333333),
                                )),
                          ),
                          Spacer(),
                          Switch(
                            value: a,
                            onChanged: (value) {
                              setState(() {
                                a = value;
                                print(a);
                              });
                            },
                            activeColor: Color(0xFFEE1939),
                          ),
                        ],
                      ),
                      SizBox(
                        h: 20,
                      ),
                      Large_RaisedButton(
                        text: "حفظ",
                        press: () async {
                          if (formValidate()) {
                            setState(() {
                              loading = true;
                            });
                            List<String> productPicList = List();
                            for (int i = 0;
                                i < listProductAssImages.length;
                                i++) {
                              var ap =
                                  await FlutterAbsolutePath.getAbsolutePath(
                                      listProductAssImages[i].path);
                              String url = await storageService.uploadPic(
                                  File(ap),
                                  i: i,
                                  bucketName: "product");
                              productPicList.add(url);
                            }
                            productPicList.addAll(widget.productItem.imageList);

                            List<String> _productVideoList = List();
                            for (int i = 0; i < listProductVideos.length; i++) {
                              String url = await storageService.uploadVideo(
                                  listProductVideos[i], "product");
                              _productVideoList.add(url);
                            }
                            _productVideoList
                                .addAll(widget.productItem.videoList);

                            Map<String, dynamic> _map = {
                              'foodName': productNameController.text,
                              'imageList': productPicList,
                              'imageUrl': productPicList.first,
                              'videoList': _productVideoList,
                              'departmentName': selectedDepartment,
                              'description': productDetailController.text,
                              'status': selectedProductStatus,
                              'calories':
                                  int.tryParse(productCaloriesController.text),
                              'size': productSizeController.text,
                              'sizeUnit': selectedSizeUnit,
                              'price':
                                  int.tryParse(productPriceController.text),
                              'discount':
                                  int.tryParse(productDiscountController.text),
                              'deposit':
                                  int.tryParse(productDepositController.text),
                              'deliveryCost': int.tryParse(
                                  productDeliveryCostController.text),
                              'readyForPickUp': b,
                              'preparationTime': fromPrepareController.text +
                                  "-" +
                                  toPrepareController.text,
                              'preparationFrom':
                                  int.tryParse(fromPrepareController.text),
                              'preparationTo':
                                  int.tryParse(toPrepareController.text),
                              'intendedForVegetarians': a,
                            };

                            await productService.updateProductData(
                                widget.productItem.docId, _map);
                            setState(() {
                              loading = false;
                            });
                            Navigator.pop(context);
                            Navigator.pop(context);
                          }
                          // Modify(context);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            loading
                ? Center(
                    child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white.withOpacity(0.8),
                    ),
                    child: Center(
                      child: Obx(
                        () => Text(
                            ' ${(storageService.progress.value * 100).toStringAsFixed(2)}${storageService.ispic.value} {${storageService.numbering.value}}   جاري الحفظ %',
                            style:
                                TextStyle(fontSize: 20, color: Colors.black)),
                      ),
                    ),
                  ))
                : Container()
          ],
        ),
      ),
    );
  }

  List<Widget> getListOfImages() {
    List<Widget> widgetList = List();
    widgetList.add(Padding(
      padding: const EdgeInsets.only(right: 15, bottom: 5, top: 5, left: 5),
      child: Container(
        width: 68,
        height: 91,
        decoration: new BoxDecoration(
          boxShadow: const [
            BoxShadow(blurRadius: 1, color: Colors.grey),
          ],
          color: Colors.white,
          borderRadius: new BorderRadius.all(Radius.circular(4)),
        ),
        child: FloatingActionButton(
          heroTag: null,
          elevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          mini: true,
          onPressed: () {
            _pickImages();
          },
          child: Icon(Icons.add),
        ),
      ),
    ));

    widget.productItem.imageList.forEach((element) {
      widgetList.add(small_imge(
        networkImage: element,
        deleteCallBack: () {
          widget.productItem.imageList.remove(element);
          setState(() {});
        },
      ));
    });

    listProductAssImages.forEach((element) {
      widgetList.add(small_imge(
        assetImg: element,
        deleteCallBack: () {
          listProductAssImages.remove(element);
          setState(() {});
        },
      ));
    });
    return widgetList;
  }

  Future<void> _pickImages() async {
    List<File> resultList = List<File>();

    try {
      resultList.add(await ImagePicker.platform
          .pickImage(source: ImageSource.gallery) as File);
      listProductAssImages = resultList;
    } on Exception catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }

    if (!mounted) return;

    setState(() {
      listProductAssImages = resultList;
    });
  }

  List<Widget> getListOfVideos() {
    List<Widget> widgetList = List();
    widgetList.add(Padding(
      padding: const EdgeInsets.only(right: 15, bottom: 5, top: 5, left: 5),
      child: Container(
        width: 68,
        height: 91,
        decoration: new BoxDecoration(
          boxShadow: const [
            BoxShadow(blurRadius: 1, color: Colors.grey),
          ],
          color: Colors.white,
          borderRadius: new BorderRadius.all(Radius.circular(4)),
        ),
        child: FloatingActionButton(
          heroTag: null,
          elevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          mini: true,
          onPressed: () {
            int oldVideo = widget.productItem.videoList.length;
            int newVideo = listProductVideos.length;
            if (oldVideo + newVideo < 3) {
              _pickVideos();
            } else {
              Fluttertoast.showToast(
                msg: "You can choose max. upto 3 videos.",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
              );
            }
          },
          child: Icon(Icons.add),
        ),
      ),
    ));

    widget.productItem.videoList.forEach((element) {
      widgetList.add(small_imge(
        Imge: "Assets/images/home-4.png",
        deleteCallBack: () {
          widget.productItem.videoList.remove(element);
          setState(() {});
        },
      ));
    });

    listProductVideos.forEach((element) {
      widgetList.add(small_imge(
        Imge: "Assets/images/home-4.png",
        deleteCallBack: () {
          listProductVideos.remove(element);
          setState(() {});
        },
      ));
    });
    return widgetList;
  }

  Future<void> _pickVideos() async {
    try {
      FilePickerResult result =
          await FilePicker.platform.pickFiles(type: FileType.video);
      if (result != null && (result?.paths?.length ?? 0) > 0)
        listProductVideos.add(File(result.paths.first));
    } on Exception catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }

    if (!mounted) return;

    setState(() {});
  }

  bool formValidate() {
    if (productNameController.text.isEmpty) {
      Fluttertoast.showToast(
        msg: "الرجاء قم بإدخال إسم المنتج",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
      return false;
    }
    // else if (listProductAssImages.isEmpty || !isfile) {
    //   Fluttertoast.showToast(
    //     msg: "الرجاء قم بإضافة صورة واحدة",
    //     toastLength: Toast.LENGTH_SHORT,
    //     gravity: ToastGravity.BOTTOM,
    //   );
    //   return false;
    // }
    else if (productDetailController.text.isEmpty) {
      Fluttertoast.showToast(
        msg: "الرجاء قم بإدخال الوصف",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
      return false;
    } else if (productSizeController.text.isEmpty) {
      Fluttertoast.showToast(
        msg: "الرجاء ادخل حجم المنتج",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
      return false;
    } else if (productPriceController.text.isEmpty) {
      Fluttertoast.showToast(
        msg: "الرجاء ادخل سعر المنتج",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
      return false;
    }
    // else if (productCaloriesController.text.isEmpty) {
    //   Fluttertoast.showToast(
    //     msg: "الرجاء ادخل السعرات الحرارية",
    //     toastLength: Toast.LENGTH_SHORT,
    //     gravity: ToastGravity.BOTTOM,
    //   );
    //   return false;
    // }
    // else if (productDepositController.text.isEmpty) {
    //   Fluttertoast.showToast(
    //     msg: "الرجاء ادخل الخصم",
    //     toastLength: Toast.LENGTH_SHORT,
    //     gravity: ToastGravity.BOTTOM,
    //   );
    //   return false;
    // }
    // else if (productDeliveryCostController.text.isEmpty) {
    //   Fluttertoast.showToast(
    //     msg: "الرجاء ادخل سعر التوصيل",
    //     toastLength: Toast.LENGTH_SHORT,
    //     gravity: ToastGravity.BOTTOM,
    //   );
    //   return false;
    // }
    else if (fromPrepareController.text.isEmpty) {
      Fluttertoast.showToast(
        msg: "الرجاء ادخل مدة التحضير من",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
      return false;
    } else if (toPrepareController.text.isEmpty) {
      Fluttertoast.showToast(
        msg: "الرجاء ادخل مدة التحضير إلى",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
      return false;
    } else
    // if (selectedProductStatus.isEmpty) {
    //   Fluttertoast.showToast(
    //     msg: "الرجاء إختر حالة المنتج",
    //     toastLength: Toast.LENGTH_SHORT,
    //     gravity: ToastGravity.BOTTOM,
    //   );
    //   return false;
    //} else
    if (selectedDepartment.isEmpty) {
      Fluttertoast.showToast(
        msg: "الرجاء إختر القسم",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
      return false;
    }
    return true;
  }
}
