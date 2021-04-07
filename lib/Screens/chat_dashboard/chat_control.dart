import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatControl {
  static Stream getMessages(String chatId) {
    return FirebaseFirestore.instance
        .collection('messages')
        .doc(chatId)
        .collection(chatId)
        .orderBy('timestamp', descending: true)
        .limit(10)
        .snapshots();
  }

  static Future<String> getUserId() async {
    User currentUser = FirebaseAuth.instance.currentUser;
    QuerySnapshot doc = await FirebaseFirestore.instance
        .collection("users")
        .where("uid", isEqualTo: currentUser.uid)
        .get();
    return doc.docs[0].id;
  }

  static Stream<QuerySnapshot> getChatUserList() {
    return FirebaseFirestore.instance.collection('messages').snapshots();
  }
}
