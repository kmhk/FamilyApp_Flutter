import 'dart:convert';
import 'dart:math';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:family/Model/user_detail.dart';
import 'package:family/main.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../app.dart';

class AuthService{

  //init firebase firestore & Auth instance
  CollectionReference users = firestore.collection('users');
  CollectionReference family = firestore.collection('families');

  //get from DB
  Future<UserDetail> fetchUserInfo(String phoneNo) async {
    return users.doc(phoneNo).get().then<UserDetail>((value) {
      if(value.exists){
        return UserDetail().fromMap(value.data());
      }else{
        return null;
      }
    });
  }

  updateLoginDate(String id) async {
    await users.doc(id).update({
      "lastLoginDate":  '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
      "token":  userToken,
    });
  }

  Future<Map<String, dynamic>> getCurrentUserData() async {
    print(firebaseAuth.currentUser.uid);
    QuerySnapshot query = await family.where('uid',isEqualTo: firebaseAuth.currentUser.uid).get();
    Map<String, dynamic> _map = query.docs[0].data();
    _map['docId'] = query.docs[0].id;
    return _map;
  }

  //FB Auth SIGNIN
  Future<UserCredential> loginUser(UserDetail account) async {
    return await firebaseAuth.signInWithEmailAndPassword(email: account.email, password: account.password);
  }

  Future<UserCredential> registerUser(UserDetail account) async {
    return await firebaseAuth.createUserWithEmailAndPassword(
        email: account.email, password: account.password);
  }

  Future<bool> checkAvailibility(UserDetail acc) async {
    QuerySnapshot querySnapshot = await users.where('email',isEqualTo: acc.email).get();
    if(querySnapshot.docs.isNotEmpty)
      return false;

    QuerySnapshot querySnapshot2 = await users.where('phone',isEqualTo: acc.phone).get();
    if(querySnapshot2.docs.isNotEmpty)
      return false;

    return true;
  }

  addUserData(
      String phoneNo,
      String password,
      String uid,
      String name,
      String email,
      String type,
      String url,
      bool showMapLocation,
      bool memberInMaroof,
      bool showMobileNumber,
      bool haveDeliveryService,
      String selectedCity,
      String selectedDistrict,
      GeoPoint geoPoint) async {
    await users.doc(phoneNo).set({
      "email": email,
      "imageUrl" : url,
      "name": name,
      "password" : password,
      "oldPassword" : password,
      "phone" : phoneNo,
      "type" : type,
      "uid": uid,
      "showMapLocation" : showMapLocation,
      "memberInMaroof" : memberInMaroof,
      "showMobileNumber" : showMobileNumber,
      "haveDeliveryService" : haveDeliveryService,
    });

    DocumentReference doc = await familiesService.family.add({
      "imageUrl" : url,
      "name": name,
      "phone" : phoneNo,
      "registrationDate" : '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
      "status" : true,
      "district": selectedDistrict,
      "uid": uid,
      "rating": 0.0,
      "noOfRating": 0,
      "username" : phoneNo,
      "living" : selectedCity,
      "showMapLocation" : showMapLocation,
      "memberInMaroof" : memberInMaroof,
      "showMobileNumber" : showMobileNumber,
      "haveDeliveryService" : haveDeliveryService,
      "position" : geoPoint
    });
    doc.get().then((value) => print(value.data()));
  }

  //FB Auth SIGNOUT
  Future<void> logoutUser() async {
    await firebaseAuth.signOut();
    await prefs.clear();
  }

  Future<void> saveUserDetails(UserDetail account) async {
    await prefs.setString("userDetails", jsonEncode(account.toJson()));
  }

  Future<UserDetail> getUserDetailsFromPref(UserDetail account) async {
    return UserDetail().fromMap(jsonDecode(prefs.getString("userDetails")));
  }

  Future<int> generateOTP(String phonenumber) async {
    var random = new Random();
    int code;
    int min = 1000;
    int max = 9999;
    code = min + random.nextInt(max - min);
    var user = "syarahstation";
    var password = "B1m4K0a1";
    var to = phonenumber;
    var message ="Code:%20" + code.toString();
    var sender = "S-STATION";
    var url = "http://www.viva-ksa.com/index.php/api/sendsms/?user=$user&pass=$password&to=$to&message=$message&sender=$sender";
    print(url);
    return code;
    // var response = await http.get(url);
    // if(response.statusCode == 200){
    //   print("sended !");
    // }else{
    //   print("not sended !");
    // }
  }

  Future resetPassword(String password,String phoneNo) async {
    print(phoneNo);
    await users.doc(phoneNo).update({"password": password,"oldPassword" : password});
    await firebaseAuth.currentUser.updatePassword(password);
    await logoutUser();
  }

  Future<bool> setResetPassword(String phoneNo,String password) async {
    users.doc(phoneNo).update({"password": password});
    return true;
  }


  Future<QuerySnapshot> getCustomerData(String familyId) {
    return users.where('uid', isEqualTo: familyId).get();
  }

  Future<QuerySnapshot> getCustomerInfo(String familyId) {
    return users.where('uid', isEqualTo: familyId).snapshots().first;
  }

  Stream<QuerySnapshot> userCustomerStream() {
    return users.where('type',isEqualTo: 'customer').snapshots();
  }

  Stream<QuerySnapshot> familiesSearchDataStream(Map searchData) {
    return users.where('type',isEqualTo: "customer").where('name',isEqualTo: searchData['name'])
        .where('living',isEqualTo: searchData['city']).where('department',isEqualTo: searchData['department']).snapshots();
  }

  Stream<QuerySnapshot> favoriteProductByCustomer(String id) {
    return users.doc(id).collection('favorite').snapshots();
  }

  Stream<QuerySnapshot> commentsProductByCustomer(String id) {
    return users.doc(id).collection('comments').snapshots();
  }

  Future<QuerySnapshot> getProfileData() async {
    return await users.where('uid',isEqualTo: firebaseAuth.currentUser.uid).get();
  }

  updateProfile(String userId,Map<String, dynamic> map,bool isPasswordChane, String email, String oldPassword, String newPassword) async {
    if(isPasswordChane){
      await logoutUser();
      await firebaseAuth.signInWithEmailAndPassword(email: email, password: oldPassword);
      await firebaseAuth.currentUser.updatePassword(newPassword);
    }
    if(isPasswordChane){
      map['password'] = newPassword;
      map['oldPassword'] = newPassword;
    }
    await users.doc(userId).update(map);

    await familiesService.updateFamily(map);
  }
}