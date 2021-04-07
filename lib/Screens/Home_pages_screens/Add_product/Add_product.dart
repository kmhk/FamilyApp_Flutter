import 'dart:io';
import 'package:path/path.dart';
import 'package:uuid/uuid.dart';
import 'package:family/Compnents/SizBox/SizBox.dart';
import 'package:family/Compnents/Widgets/DropdownButton_wigets/DropdownButton_sections.dart';
import 'package:family/Compnents/Widgets/DropdownButton_wigets/DropdownButton_size.dart';
import 'package:family/Compnents/Widgets/DropdownButton_wigets/DropdownButton_type_food.dart';
import 'package:family/Compnents/Widgets/IconButton_widgets/Back_IconButton.dart';
import 'package:family/Compnents/Widgets/Imge_wigets/small_imge.dart';
import 'package:family/Compnents/Widgets/RaisedButton_widgets/Large_RaisedButton.dart';
import 'package:family/Compnents/Widgets/TextFild_wigets/Textfield_Advertising.dart';
import 'package:family/Compnents/Widgets/TextFild_wigets/Textfield_Calories.dart';
import 'package:family/Compnents/Widgets/TextFild_wigets/Textfield_Delivery_price.dart';
import 'package:family/Compnents/Widgets/TextFild_wigets/Textfield_food.dart';
import 'package:family/Compnents/Widgets/TextFild_wigets/Textfield_price.dart';
import 'package:family/Compnents/Widgets/TextFild_wigets/Textfield_pricee.dart';
import 'package:family/Compnents/Widgets/TextFild_wigets/Textfield_time.dart';
import 'package:family/Compnents/Widgets/Text_widgets/R_medium.dart';
import 'package:family/Compnents/Widgets/Text_widgets/medium_text.dart';
import 'package:family/Compnents/Widgets/Text_widgets/mmedium_text.dart';
import 'package:family/Screens/Login_screens/loadingpage.dart';
import 'package:family/Services/families_service.dart';
import 'package:family/app.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_absolute_path/flutter_absolute_path.dart';
import 'package:flutter_document_picker/flutter_document_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart' as intl;
// import 'package:multi_image_picker/multi_image_picker.dart';

class Add_product extends StatefulWidget {
  @override
  _Add_productState createState() => _Add_productState();
}

class _Add_productState extends State<Add_product> {
  bool loading = false;
  List<File> listProductfileImages = [];
  List<File> listProductVideos = [];
  String selectedDepartment;
  String selectedProductStatus;
  String selectedSizeUnit = "كيلو";
  TextEditingController productNameController = TextEditingController();
  TextEditingController productDetailController = TextEditingController();
  TextEditingController productCaloriesController = TextEditingController();
  TextEditingController productSizeController = TextEditingController();
  TextEditingController productDiscountController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  TextEditingController productDepositController = TextEditingController();
  TextEditingController productDeliveryCostController = TextEditingController();
  TextEditingController fromPrepareController = TextEditingController();
  TextEditingController toPrepareController = TextEditingController();

  save(BuildContext context) {
    TextEditingController customcontroller = TextEditingController();

    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Container(
                  height: 100,
                  child: Center(
                    child: Text("تم إضافة منتج بنجاح",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        )),
                  )));
        });
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
                            child: medium_text(
                              text: "اضافة منتج",
                            ),
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
                      DropdownButton_sections(callBack: (value) {
                        selectedDepartment = value;
                        setState(() {});
                      }),
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
                            children: getListOfImages(context)),
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
                          children: getListOfVideos(),
                          /*[
                            Padding(
                              padding: const EdgeInsets.only(right: 15,bottom: 5,top: 5,left: 5),
                              child: Container(
                                width:68,
                                height:130,
                                decoration: new BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(blurRadius:1,color: Colors.grey ),
                                  ],
                                  color: Colors.white,
                                  borderRadius: new BorderRadius.all(Radius.circular(4)),
                                ),
                                child:FloatingActionButton(
                                  heroTag: null,
                                  elevation: 0,
                                  backgroundColor: Colors.white,
                                  foregroundColor:Colors.black,
                                  mini: true,
                                  onPressed: () {
                                    if(listProductVideos.length<=2)
                                    _pickVideos();
                                  },
                                  child: Icon(Icons.add),
                                ),
                              ),
                            ),
                            Container(
                              width:250,
                              height:140,
                              child: small_imge(
                                Imge:"Assets/images/home-4.png",
                              ),
                            ),
                          ],*/
                        ),
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
                      ),
                      mmedium(text: "السعرات الحرارية"),
                      Textfield_Calories(controller: productCaloriesController),
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
                          }),
                      Row(
                        children: [
                          mmedium(text: "سعر المنتج"),
                          R_medium(
                            text: "*",
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              width: 100,
                              child: Textfield_price(
                                  controller: productPriceController)),
                          Text("السعر بعد الخصم",
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFF333333),
                              )),
                          Container(
                              width: 100,
                              child: Textfield_price(
                                  controller: productDiscountController)),
                        ],
                      ),
                      mmedium(text: "مبلغ العربون"),
                      Textfield_pricee(controller: productDepositController),
                      mmedium(text: "سعر التوصيل"),
                      Textfield_Delivery_price(
                          controller: productDeliveryCostController),
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
                            await familiesService.getFamilyId();
                            List<String> productPicList = List();
                            for (int i = 0;
                                i < listProductfileImages.length;
                                i++) {
                              var ap = //isfile?
                                  listProductfileImages[0].path;
                              //: await FlutterAbsolutePath.getAbsolutePath(
                              //     listProductAssImages[i].path);
                              String url = await storageService.uploadPic(
                                  File(ap),
                                  i: i,
                                  bucketName: "product");

                              productPicList.add(url);
                            }

                            List<String> productVideoList = List();
                            for (int i = 0; i < listProductVideos.length; i++) {
                              String url = await storageService.uploadVideo(
                                  listProductVideos[i], "product",
                                  i: i);
                              productVideoList.add(url);
                            }

                            List<String> searchIndex =
                                productService.getSearchIndex(
                                    '${productNameController.text.trim()}');
                            List<String> familySearchIndex =
                                productService.getSearchIndex(
                                    '${currentFamily.value['name']}');
                            searchIndex.addAll(familySearchIndex);

                            List<String> departmentList;

                            if (currentFamily.value['depList'] == null) {
                              departmentList = List();
                            } else {
                              departmentList = new List<String>.from(
                                  currentFamily.value['depList']);
                            }
                            if (!departmentList.contains(selectedDepartment))
                              departmentList.add(selectedDepartment);

                            print(departmentList);
                            print(currentFamily.value['familyId']);

                            await familiesService.updateDepartment(
                                currentFamily.value['familyId'],
                                departmentList);

                            Map<String, dynamic> _map = {
                              'foodName': productNameController.text,
                              'imageList': productPicList,
                              'imageUrl': productPicList.first,
                              'videoList': productVideoList,
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
                              'familyId': currentFamily.value['familyId'],
                              'creationDate': intl.DateFormat('dd/MM/yyyy')
                                  .format(DateTime.now()),
                              'rating': "0.0",
                              'noOfOrder': 0,
                              'noOfView': 0,
                              'noOfShare': 0,
                              'noOfRating': 0,
                              "searchKeywords": searchIndex,
                            };

                            await productService.addProductData(_map);
                            setState(() {
                              loading = false;
                            });
                            Navigator.pop(context, true);
                          }
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
                : Container() // LoadingBar() : Container(),
          ],
        ),
      ),
    );
  }

  bool isfile = true;
  Future getImage(ImageSource source) async {
    final pickedFile = await ImagePicker().getImage(source: source);
    listProductfileImages.add(File(pickedFile.path));
    if (mounted)
      setState(() {
        if (pickedFile != null) {
          isfile = true;
        } else {
          isfile = false;
          print('No image selected.');
        }
      });
  }

  // Uuid uuid = Uuid();
  // Future<Asset> fileToAsset(File image) async {
  //   String fileName = basename(image.path);
  //   var decodedImage = await decodeImageFromList(image.readAsBytesSync());
  //   return Asset(uuid.v4(), fileName, decodedImage.width, decodedImage.height);
  // }

  void _showPicker(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 70,
                            color: Colors.white,
                            child: MaterialButton(
                              onPressed: () async {
                                await _pickImages() //  await getImage(ImageSource.gallery)
                                    .then((value) {
                                  Navigator.pop(context);
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Center(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.85,
                                    child: Center(
                                      child: Text(
                                        'مكتبة الصور',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                  ),
                                ),
                                //  new ListTile(
                                //    leading: new Icon(Icons.photo_library),
                                //   title: new Text('مكتبة الصور'),
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 70,
                            color: Colors.white,
                            child: MaterialButton(
                              onPressed: () async {
                                await getImage(ImageSource.camera)
                                    .then((value) {
                                  Navigator.pop(context);
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Center(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.85,
                                    child: Center(
                                      child: new Text(
                                        'آلة تصوير',
                                        // style: TextStyle(color: Colors.redAccent[400]),

                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                  ),
                                ),
                                //  new ListTile(
                                //    leading: new Icon(Icons.photo_library),
                                //   title: new Text('مكتبة الصور'),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future<void> _pickImages() async {
    List<File> resultList = List<File>();
    isfile = true;
    try {
      final tem = await FilePicker.platform
          .pickFiles(type: FileType.image, allowMultiple: true);
      tem.files.forEach((element) {
        resultList.add(File(element.path));
      });

      // maxImages: 5,
      // selectedAssets: listProductAssImages,
      // materialOptions: MaterialOptions(
      //   actionBarTitle: "كل الألبومات",
      //   allViewTitle: "كل الصور",
      //   actionBarColor: "#EE1939",
      //   actionBarTitleColor: "#bbbbbb",
      //   lightStatusBar: false,
      //   statusBarColor: '#abcdef',
      //   startInAllView: false,
      //   selectCircleStrokeColor: "#000000",
      //   selectionLimitReachedText: "لا يمكنك تحديد المزيد",
      // ),
      // cupertinoOptions: CupertinoOptions(
      //   // selectionFillColor: "#ff11ab",
      //   // selectionTextColor: "#ffffff",
      //   selectionCharacter: "✓",
      // ),

    } on Exception catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }

    if (!mounted) return;

    setState(() {
      listProductfileImages = resultList;
    });
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

  List<Widget> getListOfImages(BuildContext context) {
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
            _showPicker(context); // _pickImages();
          },
          child: Icon(Icons.add),
        ),
      ),
    ));
    // if (isfile) {
    listProductfileImages.forEach((elementfile) {
      widgetList.add(small_imge(
          assetImg: elementfile,
          deleteCallBack: () {
            listProductfileImages.remove(elementfile);
            setState(() {});
          }));
    });
    //  } else {
    //   listProductAssImages.forEach((element) {
    //     widgetList.add(small_imge(
    //       assetImg: element,
    //       deleteCallBack: () {
    //         listProductAssImages.remove(element);
    //         setState(() {});
    //       },
    //     ));
    //   });
    // }
    return widgetList;
  }

  List<Widget> getListOfVideos() {
    List<Widget> widgetList = List();
    widgetList.add(Padding(
      padding: const EdgeInsets.only(right: 15, bottom: 5, top: 5, left: 5),
      child: Container(
        width: 68,
        height: 130,
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
            if (listProductVideos.length <= 2) _pickVideos();
          },
          child: Icon(Icons.add),
        ),
      ),
    ));
    for (int i = 0; i < listProductVideos.length; i++) {
      widgetList.add(Container(
        width: 100,
        height: 140,
        child: small_imge(
          Imge: "Assets/images/home-4.png",
          deleteCallBack: () {
            listProductVideos.removeAt(i);
            setState(() {});
          },
        ),
      ));
    }
    return widgetList;
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
