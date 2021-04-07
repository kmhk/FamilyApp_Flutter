import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:family/Compnents/Careds/card_Subscription/card_Subscription.dart';
import 'package:family/Compnents/Widgets/IconButton_widgets/Back_IconButton.dart';
import 'package:family/Compnents/Widgets/Text_widgets/medium_text.dart';
import 'package:family/Model/subscription_item.dart';
import 'package:flutter/material.dart';

import '../../../app.dart';
import 'order/screens_new_order.dart';
class Subscription extends StatefulWidget {
  @override
  _SubscriptionState createState() => _SubscriptionState();
}

class _SubscriptionState extends State<Subscription> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor:Theme.of(context).backgroundColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 50.0,right: 30.0, left: 30.0, bottom: 100.0),
            child: Container(
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Directionality(
                          textDirection: TextDirection.ltr,
                          child: Back_IconButton()),
                      Padding(
                        padding: const EdgeInsets.only(right:70.0, bottom: 40.0),
                        child: medium_text(
                            text:"الاشتراكات"
                        ),
                      ),
                    ],
                  ),
                  StreamBuilder(
                      stream: subscriptionService.getAllSubScriptions(),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {

                          List<DocumentSnapshot> subscriptionData = snapshot.data.documents;

                          return ListView.builder(
                              shrinkWrap: true,
                              itemCount: subscriptionData.length,
                              itemBuilder: (context, index) {
                                DocumentSnapshot subscriptionDoc = subscriptionData[index];
                                SubscriptionItem subscriptionItem = SubscriptionItem.fromJson(subscriptionDoc.data(), subscriptionDoc.id);
                                if(subscriptionItem.orderStatus=='pending'){
                                  String type = "";
                                  for(int i=0;i<subscriptionDoc.data()['meal'].length;i++){
                                    type = type + subscriptionDoc.data()['meal'][i]['type'] + (i == subscriptionDoc.data()['meal'].length-1 ? "": ", ");
                                  }
                                  return card_Subscription(
                                    name: subscriptionDoc.data()['customerName'],
                                      type : type,
                                    page: (){
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                            return screens_new_order(subscriptionItem: subscriptionItem);
                                          }));
                                    },
                                  );
                                }else{
                                  return Container();
                                }

                              });
                        } else{
                          return Container();
                        }
                      }
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}