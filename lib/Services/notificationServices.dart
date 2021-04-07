import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../app.dart';

class NotificationService {
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  static const String serverToken =
      'AAAA4UsO2iY:APA91bESmPSIRKS--PLWP_aKsJB_wQ8mYCf37Tcm-eMy1bxl55EB0ryja2Zjj04jfC5lkcNhpT6ojRWappmcj7RMpSmsf2ugX0bnSElFFhCSeCsyU2lJ_nX1yRl7-j46Mb-z7efI3gHz';
  static sendAndRetrieveMessage(toke, body, title, bool image) async {
    Map data;

    data = {
      "registration_ids": [toke],
      "collapse_key": "type_a",
      "notification": {"title": title, "body": "📷 Image", "image": body},
      "data": {"title": title, "body": "📷 Image", "image": body}
    };

    print(data);
    Response response = await http.post(
      Uri.parse('https://fcm.googleapis.com/fcm/send'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'key=$serverToken',
      },
      body: json.encode(data),
    );

    print(response.statusCode);
  }

  static getTokenAndUpdate(String username) async {
    FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
    String token = await firebaseMessaging.getToken();
    print("FirebaseMessaging token: $token");

    await firestore.collection('users').doc(username).update({'token': token});
  }

  broadcastNotification(List<String> tokens, String body, String title) async {
    Map data = {
      "registration_ids": [tokens],
      "collapse_key": "type_a",
      "notification": {
        "title": title,
        "body": body,
      },
      "data": {
        "title": title,
        "body": body,
      }
    };

    print(data);

    Response response = await http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'key=$serverToken',
      },
      body: json.encode(data),
    );

    print(response.statusCode);
  }

  static Future<List<String>> getAllTokens() async {
    List<String> tokens = [];

    QuerySnapshot querySnapshot = await firestore.collection('users').get();
    querySnapshot.docs.forEach((element) {
      tokens.add(element.data()['token']);
    });

    return tokens;
  }

  static Future<void> onSendMessage(String chatId, String familyId,
      String customerId, String orderId, String name, String token) async {
    var documentReference = FirebaseFirestore.instance
        .collection('messages')
        .doc(chatId)
        .collection(chatId)
        .doc(DateTime.now().millisecondsSinceEpoch.toString());

    await NotificationService.sendAndRetrieveMessage(
        token, 'send you a response on your order', name, false);

    firestore.runTransaction((transaction) async {
      transaction.set(
        documentReference,
        {
          'idFrom': familyId,
          'idTo': customerId,
          'sender': familyId,
          'timestamp': DateTime.now().millisecondsSinceEpoch,
          'content': orderId,
          'type': 'special'
        },
      );
    });
  }
}
