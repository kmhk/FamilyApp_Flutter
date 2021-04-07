import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:family/Compnents/Widgets/IconButton_widgets/Back_IconButton.dart';
import 'package:family/Screens/chat_dashboard/chat_control.dart';
import 'package:family/Services/notificationServices.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class AdminChatScreen extends StatefulWidget {
  String sender, reciever, name;
  // String nickname, photoUrl;

  AdminChatScreen({this.sender, this.reciever, this.name});

  @override
  _AdminChatScreenState createState() => _AdminChatScreenState();
}

class _AdminChatScreenState extends State<AdminChatScreen> {
  final TextEditingController textEditingController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  String chatId, groupId;
  final ScrollController listScrollController = ScrollController();
  List<DocumentSnapshot> listMessage;
  File imagePath;
  String imageUrl;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    chatId = '';
    if (widget.reciever.hashCode <= widget.reciever.hashCode) {
      chatId = '${widget.reciever}-${widget.reciever}';
    } else {
      chatId = '${widget.reciever}-${widget.reciever}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        // appBar: AppBar(
        //   title: Container(
        //       margin: EdgeInsets.only(left: 5),
        //       child: Text(
        //         widget.name,
        //       )),
        //   centerTitle: true,
        // ),
        body: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      top: 50.0, right: 30.0, left: 30.0, bottom: 10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(right: 80, top: 10),
                          child: Text("الدعم الفني",
                              style: TextStyle(
                                fontSize: 26,
                              ))),
                      Spacer(),
                      Back_IconButton(),
                    ],
                  ),
                ),
                messageList(),
                sendMessageBar(),
              ],
            ),
            buildLoading()
          ],
        ));
  }

  Widget sendMessageBar() {
    return Container(
      width: double.infinity,
      height: 60.0,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
      margin: EdgeInsets.only(right: 10, left: 10, bottom: 10),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 1.0),
            child: IconButton(
              icon: Icon(Icons.image),
              onPressed: () {
                getImage();
              },
            ),
          ),
          Expanded(
            child: Container(
                child: TextField(
              controller: textEditingController,
              textAlign: TextAlign.right,
              autofocus: true,
              style: TextStyle(
                fontSize: 18.0,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.only(
                    left: 14.0, bottom: 8.0, top: 8.0, right: 14.0),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  borderSide: BorderSide(
                      color: Color(0xFFEE1939).withOpacity(0.5), width: 2.0),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  borderSide: BorderSide(
                      color: Colors.black.withOpacity(0.2), width: 1.0),
                ),
              ),
            )
                /*TextField(
                controller: textEditingController,
                decoration: InputDecoration.collapsed(
                  hintText: 'Type your message...',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
                focusNode: focusNode,
              ),*/
                ),
          ),

          // Button send message
          Container(
            // margin: EdgeInsets.symmetric(horizontal: 8.0),
            child: IconButton(
              icon: Icon(
                Icons.send,
                size: 30,
              ),
              onPressed: () {
                onSendMessage(textEditingController.text, "text");
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget messageList() {
    return Flexible(
      child: chatId == ''
          ? Center(child: CircularProgressIndicator())
          : StreamBuilder(
              stream: ChatControl.getMessages(chatId),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  listMessage = snapshot.data.docs;
                  return ListView.builder(
                    padding: EdgeInsets.all(10.0),
                    itemBuilder: (context, index) =>
                        buildItem(index, listMessage[index]),
                    itemCount: listMessage.length,
                    reverse: true,
                    controller: listScrollController,
                  );
                }
              },
            ),
    );
  }

  Widget buildItem(int index, DocumentSnapshot document) {
    if (document['idFrom'] == widget.sender) {
      return InkWell(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            document['type'] == "text"
                ? Flexible(
                    child: Container(
                    padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                    decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(15)),
                    margin: EdgeInsets.only(right: 10.0, bottom: 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Flexible(
                          child: Container(
                            child: Text(document['content']),
                          ),
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Container(
                          child: Text(
                            convertTime(document['timestamp']),
                            style:
                                TextStyle(color: Colors.white.withOpacity(0.5)),
                          ),
                          margin: EdgeInsets.only(left: 10.0),
                        )
                      ],
                    ),
                  ))
                : Container(
                    child: Stack(
                      children: <Widget>[
                        FlatButton(
                          child: Material(
                            child: CachedNetworkImage(
                              placeholder: (context, url) => Container(
                                child: CircularProgressIndicator(),
                                width: 200.0,
                                height: 200.0,
                                padding: EdgeInsets.all(70.0),
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.0),
                                  ),
                                ),
                              ),
                              imageUrl: document['content'],
                              width: 200.0,
                              height: 200.0,
                              fit: BoxFit.cover,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                            clipBehavior: Clip.hardEdge,
                          ),
                          onPressed: () {},
                          padding: EdgeInsets.all(0),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            child: Text(
                              convertTime(document['timestamp']),
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.5)),
                            ),
                            margin: EdgeInsets.only(right: 10, bottom: 10),
                          ),
                        )
                      ],
                    ),
                    margin: EdgeInsets.only(right: 10.0, bottom: 10),
                    height: 200,
                    width: 200,
                  )
          ],
        ),
        onTap: () {
          String id = document.id;
          print(id);
        },
      );
    } else {
      return Row(
        children: <Widget>[
          document['type'] == "text"
              ? Flexible(
                  child: Container(
                  padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                  decoration: BoxDecoration(
                      color: Color(0xFFEE1939),
                      borderRadius: BorderRadius.circular(15)),
                  margin: EdgeInsets.only(right: 10.0, bottom: 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Flexible(
                        child: Container(
                          child: Text(document['content']),
                        ),
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      Container(
                        child: Text(
                          convertTime(document['timestamp']),
                          style:
                              TextStyle(color: Colors.white.withOpacity(0.5)),
                        ),
                        margin: EdgeInsets.only(left: 10.0),
                      )
                    ],
                  ),
                ))
              : Container(
                  child: Stack(
                    children: <Widget>[
                      InkWell(
                        child: Material(
                          child: CachedNetworkImage(
                            placeholder: (context, url) => Container(
                              child: CircularProgressIndicator(),
                              width: 200.0,
                              height: 200.0,
                              padding: EdgeInsets.all(70.0),
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                              ),
                            ),
                            imageUrl: document['content'],
                            width: 200.0,
                            height: 200.0,
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          clipBehavior: Clip.hardEdge,
                        ),
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: CachedNetworkImage(
                                  placeholder: (context, url) => Container(
                                    child: CircularProgressIndicator(),
                                  ),
                                  imageUrl: document['content'],
                                  // fit: BoxFit.cover,
                                ),
                              );
                            },
                          );
                        },
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          child: Text(
                            convertTime(document['timestamp']),
                            style:
                                TextStyle(color: Colors.white.withOpacity(0.5)),
                          ),
                          margin: EdgeInsets.only(right: 10, bottom: 10),
                        ),
                      )
                    ],
                  ),
                  margin: EdgeInsets.only(right: 10.0, bottom: 10),
                  height: 200,
                  width: 200,
                )
        ],
      );
    }
  }

  Future<void> onSendMessage(String content, String type) async {
    if (content.trim() != '') {
      textEditingController.clear();
      String sender = "sender";
      String token;

      await FirebaseFirestore.instance
          .collection('users')
          .doc(widget.sender)
          .get()
          .then((value) async {
        sender = await value.data()['name'];
// print(sender);
      });
      await FirebaseFirestore.instance
          .collection('users')
          .doc(widget.reciever)
          .get()
          .then((value) async {
        token = await value.data()['token'];
// print(sender);
      });

      print("Message sending by $sender");

      await FirebaseFirestore.instance.collection('messages').doc(chatId).set({
        'chatId': chatId,
        'customer': sender,
        'lastMessage': type == 'photo' ? "📷 Image" : content,
        'lastTime': DateTime.now()
      });

      var documentReference = FirebaseFirestore.instance
          .collection('messages')
          .doc(chatId)
          .collection(chatId)
          .doc(DateTime.now().millisecondsSinceEpoch.toString());

      FirebaseFirestore.instance.runTransaction((transaction) async {
        await transaction.set(
          documentReference,
          {
            'idFrom': widget.sender,
            'idTo': widget.reciever,
            'sender': sender,
            'timestamp': DateTime.now().millisecondsSinceEpoch,
            'content': content,
            'type': type
          },
        );
      });

      if (type == "text") {
        await NotificationService.sendAndRetrieveMessage(
            token, content, sender, false);
      } else {
        await NotificationService.sendAndRetrieveMessage(
            token, content, sender, true);
      }

      print("Message sent by $sender");
      listScrollController.animateTo(0.0,
          duration: Duration(milliseconds: 300), curve: Curves.easeOut);
    }
  }

  convertTime(int timestamp) {
    var date = new DateTime.fromMillisecondsSinceEpoch(timestamp);
    var format = DateFormat.Hm();
    if (int.parse(format.format(date).toString().split(':').first) < 12) {
      return "${format.format(date).toString()} AM";
    } else {
      List<String> time = format.format(date).toString().split(':');
      time.first = (int.parse(time.first) - 12).toString();
      return '${time.first}:${time.last} PM';
    }
  }

  getImage() async {
    imagePath = (await ImagePicker().getImage(source: ImageSource.gallery)) as File;
    if (imagePath != null) {
      setState(() {
        isLoading = true;
      });
      uploadFile();
    }
  }

  Future uploadFile() async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child(fileName);
    UploadTask uploadTask = reference.putFile(imagePath);
    TaskSnapshot storageTaskSnapshot =
        await uploadTask.whenComplete(() => null);
    storageTaskSnapshot.ref.getDownloadURL().then((downloadUrl) {
      imageUrl = downloadUrl;
      setState(() {
        isLoading = false;
        onSendMessage(imageUrl, "photo");
      });
    }, onError: (err) {
      setState(() {
        isLoading = false;
      });
    });
  }

  Future<String> getSender(DocumentSnapshot document) async {
    String sender = "";
    DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
        .doc('users/${document['idFrom']}')
        .get();
    sender = await documentSnapshot.data()['nickname'];
//    print(sender);
    return sender;
  }

  Widget buildLoading() {
    return Positioned(
      child: isLoading
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
              color: Colors.white.withOpacity(0.8),
            )
          : Container(),
    );
  }
}
