import 'package:cloud_firestore/cloud_firestore.dart';

import '../app.dart';

class SubscriptionService {

  CollectionReference subscription = firestore.collection('subscription');
  CollectionReference special = firestore.collection('specialOrder');


  Stream<QuerySnapshot> getAllSubScriptions() {
    return subscription.snapshots();
  }
  
  Future<QuerySnapshot> getSubFamily(String docId, String familyId) {
    return subscription.doc(docId).collection('family').where("familyId", isEqualTo: familyId).get();
  }
  Stream<QuerySnapshot> getSpecialFamily(String docId, String familyId) {
    return special.doc(docId).collection('family').where("familyId", isEqualTo: familyId).snapshots();
  }

  Future stopService(bool value,String docuId) async {
    if(value){
      subscription.doc(docuId).update({
        'orderStatus' : 'cancel'
      });
    }else{
      special.doc(docuId).update({
        'orderStatus' : 'cancel'
      });
    }
  }

  addFamilyDataToSub(
      String orderId,
      String familyId,
      String familyName) async {
    await subscription.doc(orderId).collection("family").doc(familyId).set({
      "familyId": familyId,
      "familyName" : familyName,
      "orderStatus": false
    });
  }
  addFamilyDataToSpecial(
      String orderId,
      String familyId,
      String familyName) async {
    await special.doc(orderId).collection("family").doc(familyId).set({
      "familyId": familyId,
      "familyName" : familyName,
      "orderStatus": false
    });
  }

}