import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:family/Compnents/Careds/card_Message/card_Message.dart';
import 'package:family/Compnents/Widgets/IconButton_widgets/Back_IconButton.dart';
import 'package:family/Compnents/Widgets/Text_widgets/medium_text.dart';
import 'package:family/Screens/chat_dashboard/chat_control.dart';
import 'package:family/Services/families_service.dart';
import 'package:flutter/material.dart';

import 'Massage.dart';

class Messages extends StatefulWidget {
  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
                top: 50.0, right: 30.0, left: 30.0, bottom: 100.0),
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
                        padding:
                            const EdgeInsets.only(right: 70.0, bottom: 40.0),
                        child: medium_text(text: "المراسلة"),
                      ),
                    ],
                  ),
                  StreamBuilder<QuerySnapshot>(
                    stream: ChatControl.getChatUserList(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<DocumentSnapshot> doc = snapshot.data.docs;
                        if (doc.isNotEmpty) {
                          doc = doc
                              .where((element) => element.id
                                  .split('-')
                                  .contains(currentFamily.value['uid']))
                              .toList();
                          return ListView.builder(
                            itemCount: doc.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) => card_Message(
                              text: "ابغى مفطح مطبوخ ب الطريقة الفلانية",
                              name: "خالد",
                              msg: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return Massage();
                                }));
                              },
                            ),
                          );
                        } else {
                          return Container();
                        }
                      } else {
                        return Container();
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
