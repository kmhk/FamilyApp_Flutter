import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:family/Compnents/Careds/Cards_Special_request/card_Special_request/card_Special_request.dart';
import 'package:family/Compnents/Careds/Cards_Special_request/card_buffet/card_buffet.dart';
import 'package:family/Compnents/Careds/Cards_Special_request/card_subscription/card_subscription.dart';
import 'package:family/Compnents/Widgets/IconButton_widgets/Back_IconButton.dart';
import 'package:family/Compnents/Widgets/Text_widgets/medium_text.dart';
import 'package:family/Model/special_model.dart';
import 'package:family/Model/subscription_item.dart';
import 'package:family/Model/user_detail.dart';
import 'package:family/Screens/Home_pages_screens/Subscription/order/screens_new_order.dart';
import 'package:family/Screens/chat_dashboard/chat_screen.dart';
import 'package:family/Services/families_service.dart';
import 'package:family/Services/notificationServices.dart';
import 'package:family/app.dart';
import 'package:flutter/material.dart';

import 'Massages_Special_request.dart';
class Special_request extends StatefulWidget {
  @override
  _Special_requestState createState() => _Special_requestState();
}

class _Special_requestState extends State<Special_request> {

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor:Theme.of(context).backgroundColor,
        body: Padding(
          padding: const EdgeInsets.only(top: 50.0,right: 20.0, left: 30.0, bottom: 100.0),
          child: Container(
            child: SingleChildScrollView(

              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Directionality(
                          textDirection: TextDirection.ltr,
                          child: Back_IconButton()),
                      Padding(
                        padding: const EdgeInsets.only( bottom: 40.0),
                        child: medium_text(
                          text:"الطلبات الخاصة\n"
                            "والبوفيهات و الاشتراكات",
                        ),
                      ),
                    ],
                  ),
                  StreamBuilder(
                    stream: orderService.streamSpecialOrders(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if(snapshot.hasData){
                      return ListView.builder(
                        itemCount: snapshot.data.docs.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                        SpecialModel model;
                        if(snapshot.data.docs[index].data()['orderStatus']=='pending'){
                          if(snapshot.data.docs[index].data()['type']=='buffet'){
                            model = SpecialModel.fromBuffetJson(snapshot.data.docs[index].data(),snapshot.data.docs[index].id);
                            return StreamBuilder(
                                stream: subscriptionService.getSpecialFamily(model.docId, currentFamily.value['familyId']),
                                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot2) {
                                  if(snapshot2.hasData){
                                    print(snapshot2.data.docs.length);
                                    return card_buffet(
                                      // text: "ابغى مفطح مطبوخ ب الطريقة الفلانية",
                                      name: model.orderName,
                                      date: "${model.createDateTime.year}/${model.createDateTime.month}/${model.createDateTime.day} ${model.createDateTime.hour}:${model.createDateTime.minute}",
                                      status: snapshot2.data.docs.isEmpty,
                                      msg: () async {

                                        Map map = await authService.getCurrentUserData();

                                        Navigator.push(context,
                                            MaterialPageRoute(builder: (context) {
                                              return ChatScreen(
                                                  sender: currentFamily.value['familyId'],
                                                  reciever: model.customerId,
                                                  senderName: map['name'],
                                                  recName: model.customerName,
                                                  orderData: SubscriptionItem(
                                                      docId: model.docId));
                                            }));
                                      },
                                      onSendResponse: () async {

                                        await subscriptionService.addFamilyDataToSpecial(model.docId, currentFamily.value['familyId'], currentFamily.value['name']);
                                        String chatId = '';
                                        if (currentFamily.value['familyId'].hashCode <= model.customerId.hashCode) {
                                          chatId = '${currentFamily.value['familyId']}-${model.customerId}-${model.docId}';
                                        } else {
                                          chatId = '${model.customerId}-${currentFamily.value['familyId']}-${model.docId}';
                                        }

                                        UserDetail customerData = await authService.fetchUserInfo(model.customerId);

                                        await NotificationService.onSendMessage(chatId,currentFamily.value['familyId'],  model.customerId,model.docId,currentFamily.value['name'],customerData.token);

                                        Navigator.push(context,
                                            MaterialPageRoute(builder: (context) {
                                              return ChatScreen(
                                                sender: currentFamily.value['familyId'],
                                                reciever: model.customerId,
                                                senderName: currentFamily.value['name'],
                                                recName: model.customerName,
                                                orderData: SubscriptionItem(
                                                    docId: model.docId),
                                              );
                                              // Massages_Subscription_request(widget.subscriptionItem);
                                            }));
                                      },
                                    );
                                  }else{
                                    return Container();
                                  }

                                }
                            );
                          }
                          else{
                            model = SpecialModel.fromCustomOrderJson(snapshot.data.docs[index].data(),snapshot.data.docs[index].id);
                            return StreamBuilder(
                              stream: subscriptionService.getSpecialFamily(model.docId, currentFamily.value['familyId']),
                              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot2) {
                                if(snapshot2.hasData){
                                  return card_Special_request(
                                    // text: "ابغى مفطح مطبوخ ب الطريقة الفلانية",
                                    name: model.orderName,
                                    date: "${model.createDateTime.year}/${model.createDateTime.month}/${model.createDateTime.day} ${model.createDateTime.hour}:${model.createDateTime.minute}",
                                    food: model.customerName,
                                    status: snapshot2.data.docs.isEmpty,
                                    msg: () async {

                                      Map map = await authService.getCurrentUserData();

                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                            return ChatScreen(
                                                sender: currentFamily.value['familyId'],
                                                reciever: model.customerId,
                                                senderName: map['name'],
                                                recName: model.customerName,
                                                orderData: SubscriptionItem(
                                                    docId: model.docId));
                                          }));
                                    },
                                    onSendResponse: () async {

                                      await subscriptionService.addFamilyDataToSpecial(model.docId, currentFamily.value['familyId'], currentFamily.value['name']);
                                      String chatId = '';
                                      if (currentFamily.value['familyId'].hashCode <= model.customerId.hashCode) {
                                        chatId = '${currentFamily.value['familyId']}-${model.customerId}-${model.docId}';
                                      } else {
                                        chatId = '${model.customerId}-${currentFamily.value['familyId']}-${model.docId}';
                                      }

                                      UserDetail customerData = await authService.fetchUserInfo(model.customerId);

                                      await NotificationService.onSendMessage(chatId,currentFamily.value['familyId'],  model.customerId,model.docId,currentFamily.value['name'],customerData.token);

                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                            return ChatScreen(
                                              sender: currentFamily.value['familyId'],
                                              reciever: model.customerId,
                                              senderName: currentFamily.value['name'],
                                              recName: model.customerName,
                                              orderData: SubscriptionItem(
                                                  docId: model.docId),
                                            );
                                            // Massages_Subscription_request(widget.subscriptionItem);
                                          }));
                                    },
                                  );
                                }else{
                                  return Container();
                                }

                              }
                            );
                          }
                        }else{
                          return Container();
                        }

                      },);
                    }else{
                      return Container();
                    }
                  },),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


