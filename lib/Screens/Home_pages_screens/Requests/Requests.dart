import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:family/Compnents/Careds/Card_requestst/Card_requestst.dart';
import 'package:family/Compnents/Widgets/IconButton_widgets/Back_IconButton.dart';
import 'package:family/Model/product_item.dart';
import 'package:family/Model/subscription_item.dart';
import 'package:family/Screens/Home_pages_screens/Foode_screen/Delete_foode_screen.dart';
import 'package:family/Screens/chat_dashboard/chat_screen.dart';
import 'package:family/app.dart';
import 'package:flutter/material.dart';
class Requests extends StatefulWidget {
  @override
  _RequestsState createState() => _RequestsState();
}

class _RequestsState extends State<Requests> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body:SingleChildScrollView(
          child:  Container(
              child: Column(
                children: [
                  Padding(
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
                          child: Text("الطلبات",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 32,
                                color: Color(0xFF333333),
                              )),
                        )
                      ],
                    ),
                  ),
                  StreamBuilder(
                    stream: orderService.getOrders(prefs.getString('familyId')),
                    builder: (context, AsyncSnapshot snapshot) {
                      if(snapshot.hasData) {
                        List<DocumentSnapshot> docs = snapshot.data.documents;
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: docs.length,
                          itemBuilder: (context, index) {
                            return StreamBuilder(
                              stream: productService.getSingleProduct(docs[index].data()['productId']),
                              builder: (context, AsyncSnapshot<DocumentSnapshot> snap) {
                                if(snapshot.hasData){
                                  Map productDocs = snap.data?.data();
                                  return Card_requestst(
                                    imge:productDocs!=null ? productDocs['imageList'][0] : "",
                                    name_food:productDocs!=null ?productDocs['foodName'] : "",
                                    doc: docs[index],
                                    food: () async {
                                      ProductItem product = ProductItem.fromJson(productDocs, snap.data.id);

                                      bool flag = await orderService.getOrderStatus(docs[index].id);
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                            return ChatScreen(
                                        sender: docs[index].data()['familyId'],
                                        reciever: docs[index].data()['customerId'],
                                        recName: docs[index].data()['customerName'],
                                        senderName: docs[index].data()['familyName'],
                                        orderData: SubscriptionItem(docId: docs[index].id),
                                        flag: flag,
                                      );
                                    }));
                                    },
                                  );
                                }else{
                                  return Container();
                                }
                              },);
                          },);
                      } else{
                        return Container();
                      }
                    },
                  )

                ],
              ),
          ),
        ) ,
      ),
    );
  }
}
