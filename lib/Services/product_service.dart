import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../app.dart';

class ProductService {

  CollectionReference product = firestore.collection('products');


  Stream<DocumentSnapshot> getProductFromId(String familyId) {
    return product.doc(familyId).snapshots();
  }

  addProductData(Map<String, dynamic> map) async {
    DocumentReference doc = await product.add(map);
    print(doc.id);
  }

  updateProductData(String id, Map<String, dynamic> map) async {
    await product.doc(id).update(map);
  }

  Future<bool> removeProduct(String id) async {
    await product.doc(id).delete();
    return true;
  }

  activateProduct(String id) async {
    await product.doc(id).update({
      "status" : true
    });
  }

  Stream<QuerySnapshot> getProductList(String familyId) {
    return product.where("familyId", isEqualTo: familyId).snapshots();
  }
  Stream<DocumentSnapshot> getSingleProduct(String productId) {
    return product.doc(productId).snapshots();
  }

  Stream<QuerySnapshot> streamBlockedFood() {
    return product.where("status", isEqualTo: false).snapshots();
  }

  Stream<QuerySnapshot> streamProductByDepartment(String id) {
    return product.where("department", isEqualTo: id).snapshots();
  }

  Stream<QuerySnapshot> commentsOfProduct(String id) {
    return product.doc(id).collection('comments').snapshots();
  }

  List<String> getSearchIndex(String text) {
    List<String> splitList = text.split(" ");
    List<String> indexList = [];

    for (String s in splitList) {
      for (int i = 1; i < s.length + 1; i++) {
        indexList.add(s.substring(0, i).toLowerCase());
      }
    }

    for (int i = 1; i < text.length + 1; i++) {
      indexList.add(text.substring(0, i).toLowerCase());
    }

    indexList = LinkedHashSet<String>.from(indexList).toList();
    return indexList;
  }


  // where('living',isEqualTo: searchData['city']).where('department',isEqualTo: searchData['department'])

}