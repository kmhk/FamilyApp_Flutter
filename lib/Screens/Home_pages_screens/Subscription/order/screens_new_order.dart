import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:family/Compnents/SizBox/SizBox.dart';
import 'package:family/Compnents/Widgets/Container/Container_date.dart';
import 'package:family/Compnents/Widgets/IconButton_widgets/Back_IconButton.dart';
import 'package:family/Compnents/Widgets/RaisedButton_widgets/Large_RaisedButton.dart';
import 'package:family/Compnents/Widgets/TextFild_wigets/Textfield_Advertising.dart';
import 'package:family/Compnents/Widgets/Text_widgets/Large_text.dart';
import 'package:family/Compnents/Widgets/Text_widgets/medium_text.dart';
import 'package:family/Compnents/Widgets/checkbox/checkbox_breakfast.dart';
import 'package:family/Model/subscription_item.dart';
import 'package:family/Model/user_detail.dart';
import 'package:family/Screens/chat_dashboard/chat_screen.dart';
import 'package:family/Services/families_service.dart';
import 'package:family/Services/notificationServices.dart';
import 'package:flutter/material.dart';

import '../../../../app.dart';
import 'Massages_Subscription_request.dart';
class screens_new_order extends StatefulWidget {
  SubscriptionItem subscriptionItem;
  screens_new_order({this.subscriptionItem});

  @override
  _screens_new_orderState createState() => _screens_new_orderState();
}

class _screens_new_orderState extends State<screens_new_order> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor:Theme.of(context).backgroundColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 50.0,right: 30.0, left: 30.0, bottom: 10.0),
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
                      padding: const EdgeInsets.only(right: 50),
                      child: medium_text(
                        text: "طلب اشتراك",
                      ),
                    ),
                  ],
                ),
                Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top:10,bottom:10),
                        child: Container(
                          height: 450,
                          child: ListView.builder(
                            itemCount: widget.subscriptionItem.meal.length,
                              itemBuilder: (context, index) {
                                Meal meal = widget.subscriptionItem.meal[index];
                                Map<String, bool> breakFastDays = {
                                  'Sun': meal.days.contains("Sun"),
                                  'Mon': meal.days.contains("Mon"),
                                  'Tues': meal.days.contains("Tues"),
                                  'Wed': meal.days.contains("Wed"),
                                  'Thurs': meal.days.contains("Thurs"),
                                  'Fri': meal.days.contains("Fri"),
                                  'Sat': meal.days.contains("Sat"),
                                };
                                TextEditingController decController = TextEditingController(text: meal.description);
                                return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Large_text(
                                          text: getTypes(meal.type),
                                        ),
                                        SizBox(
                                          h: 20,
                                        ),
                                        checkbox_breakfast(breakFastDays),
                                        medium_text(
                                          text: "وصف الطلب",
                                        ),
                                        IgnorePointer(child: Textfield_Advertising(controller: decController)),
                                        medium_text(
                                          text: "مدة الاشتراك",
                                        ),
                                        IgnorePointer(child: Container_date(meal.dateFrom, meal.dateTo)),
                                        SizBox(
                                          h: 30,
                                        ),
                                      ]);
                                }
                          )

                          // ListView(
                          //   children: [
                          //     Container(
                          //       child: Column(
                          //         crossAxisAlignment: CrossAxisAlignment.start,
                          //         mainAxisAlignment: MainAxisAlignment.start,
                          //         children: [
                          //           Large_text(
                          //             text: "الافطار",
                          //           ),
                          //
                          //           SizBox(
                          //             h: 20,
                          //           ),
                          //           checkbox_breakfast(),
                          //           medium_text(
                          //             text: "وصف الطلب",
                          //           ),
                          //           Textfield_Advertising(),
                          //           medium_text(
                          //             text: "مدة الاشتراك",
                          //           ),
                          //           Container_date(),
                          //
                          //           SizBox(
                          //             h: 30,
                          //           ),
                          //
                          //
                          //           Large_text(
                          //             text: "الغداء",
                          //           ),
                          //           SizBox(
                          //             h: 20,
                          //           ),
                          //           checkbox_breakfast(),
                          //           medium_text(
                          //             text: "وصف الطلب",
                          //           ),
                          //           Textfield_Advertising(),
                          //           medium_text(
                          //             text: "مدة الاشتراك",
                          //           ),
                          //           Container_date(),
                          //
                          //           SizBox(
                          //             h: 30,
                          //           ),



                          //           Large_text(
                          //             text: "العشاء",
                          //           ),
                          //           SizBox(
                          //             h: 20,
                          //           ),
                          //           checkbox_breakfast(),
                          //           medium_text(
                          //             text: "وصف الطلب",
                          //           ),
                          //           Textfield_Advertising(),
                          //           medium_text(
                          //             text: "مدة الاشتراك",
                          //           ),
                          //           Container_date(),
                          //
                          //           SizBox(
                          //             h: 30,
                          //           ),
                          //           Large_text(
                          //             text: "السحور",
                          //           ),
                          //           SizBox(
                          //             h: 20,
                          //           ),
                          //           checkbox_breakfast(),
                          //           medium_text(
                          //             text: "وصف الطلب",
                          //           ),
                          //           Textfield_Advertising(),
                          //           medium_text(
                          //             text: "مدة الاشتراك",
                          //           ),
                          //           Container_date(),
                          //
                          //
                          //           SizBox(
                          //             h: 30,
                          //           ),     ],
                          //       ),
                          //     ),
                          //   ],
                          // ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Large_RaisedButton(
                    text: "مراسلة",
                    press: () async {
                      QuerySnapshot querySnap = await subscriptionService.getSubFamily(widget.subscriptionItem.docId, currentFamily.value['familyId']);
                      if(querySnap.docs.isEmpty) {
                        await subscriptionService.addFamilyDataToSub(widget.subscriptionItem.docId, currentFamily.value['familyId'], currentFamily.value['name']);
                        String chatId = '';
                        if (currentFamily.value['familyId'].hashCode <= widget.subscriptionItem.customerId.hashCode) {
                          chatId = '${currentFamily.value['familyId']}-${widget.subscriptionItem.customerId}-${widget.subscriptionItem.docId}';
                        } else {
                          chatId = '${widget.subscriptionItem.customerId}-${currentFamily.value['familyId']}-${widget.subscriptionItem.docId}';
                        }

                        UserDetail customerData = await authService.fetchUserInfo(widget.subscriptionItem.customerId);

                        await NotificationService.onSendMessage(chatId,currentFamily.value['familyId'],  widget.subscriptionItem.customerId ,widget.subscriptionItem.docId,currentFamily.value['name'],customerData.token);

                      }

                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return ChatScreen(
                            sender: currentFamily.value['familyId'],
                            reciever: widget.subscriptionItem.customerId,
                            senderName: currentFamily.value['name'],
                            recName: widget.subscriptionItem.customerName,
                              orderData: widget.subscriptionItem,
                            );
                        // Massages_Subscription_request(widget.subscriptionItem);
                          }));
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  getTypes(String type) {
    switch (type) {
      case "Breakfast":
        return "الافطار";
        break;
      case "Lunch":
      return "الغداء";
        break;
      case "Dinner":
      return "العشاء";
        break;
      default:
        return "السحور";
        break;
    }
  }
}


