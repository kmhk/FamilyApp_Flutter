import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:family/app.dart';

class OrderService{
  CollectionReference orders = firestore.collection('orders');
  CollectionReference subscription = firestore.collection('subscription');
  CollectionReference specialOrder = firestore.collection('specialOrder');

  Stream getOrders(String familyId) {
    return orders.where('familyId',isEqualTo: familyId).snapshots();
  }


  acceptSubscriptionForFamily(String docId, String familyId) {
    return subscription.doc(docId).collection("family").doc(familyId).update({"orderStatus" : true});
  }

  acceptOrder(String docId) {
    return orders.doc(docId).update({"status" : 'active'});
  }

  Future<bool> getOrderStatus(String docId) async {
    DocumentSnapshot doc = await orders.doc(docId).get();
    return doc.data()['status'] == 'pending';
  }

  Stream<QuerySnapshot> subscriptionStatus(String docId) {
    return subscription.doc(docId).collection("family").snapshots();
  }

  Stream<QuerySnapshot> streamSpecialOrders(){
    return specialOrder.snapshots();
  }


  Stream<QuerySnapshot> specialOrderStatus(String docId) {
    return specialOrder.doc(docId).collection("family").snapshots();
  }

}