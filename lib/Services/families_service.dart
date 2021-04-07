import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:family/app.dart';
import 'package:flutter/material.dart';

ValueNotifier<Map<String, dynamic>> currentFamily = new ValueNotifier(Map<String, dynamic>());

class FamiliesService {
  CollectionReference family = firestore.collection('families');

  updateLoginDate(String id) async {
    Map data = await authService.getCurrentUserData();
    await authService.updateLoginDate(data['phone']);
    await family.doc(id).update({
      "lastLoginDate":  '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
    });
  }
  updateDepartment(String id,List<String> depList) async {
     await family.doc(id).update({
      "depList":  depList,
    });
    currentFamily.value['depList'] = depList;
  }

  Stream<QuerySnapshot> getFamilyData() {
     return family.where("uid",isEqualTo: firebaseAuth.currentUser.uid).snapshots();
  }
  
  getFamilyId() async {
    QuerySnapshot querySnapshot = await family.where("uid",isEqualTo: firebaseAuth.currentUser.uid).get();
    if(querySnapshot.docs.length>0) {
      Map<String, dynamic> _map = querySnapshot.docs.first.data();
      _map['familyId'] = querySnapshot.docs.first.id;
      currentFamily.value = _map;
      print(currentFamily.value);
      return querySnapshot.docs.first.id;
    }
  }

  updateFamily(Map<String, dynamic> map) async {
    QuerySnapshot querySnapshot = await family.where("uid",isEqualTo: firebaseAuth.currentUser.uid).get();
    final doc = querySnapshot.docs.first;

    map.removeWhere((key, value) => key=="password");
    map.removeWhere((key, value) => key=="oldPassword");

    await family.doc(doc.id).update(map);
    currentFamily.value['name'] = map['name'];
    currentFamily.value['imageUrl'] = map['imageUrl'];
    currentFamily.value['showMapLocation'] = map['showMapLocation'];
    currentFamily.value['memberInMaroof'] = map['memberInMaroof'];
    currentFamily.value['showMobileNumber'] = map['showMobileNumber'];
    currentFamily.value['haveDeliveryService'] = map['haveDeliveryService'];
    currentFamily.value['haveDeliveryService'] = map['haveDeliveryService'];
    currentFamily.value['district'] = map['district'];
    currentFamily.value['living'] = map['living'];
  }
}