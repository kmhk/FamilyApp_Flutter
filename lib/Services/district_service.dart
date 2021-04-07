import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:family/app.dart';

class DistrictService {

  CollectionReference district = firestore.collection('districts');

  addDistrict(String districtName,String cityName) async {
    await district.doc().set({
      "district" : districtName,
      "city" : cityName,
      "status" : true
    });
  }

  removeDistrict(String id) async {
    await district.doc(id).delete();
  }

  editDistrict(String id,String districtName, String cityName) async {
    await district.doc(id).update({
      "district" : districtName,
      "city" : cityName,
    });
  }

  turnOff(String id) async {
    await district.doc(id).update({
      "status" : false
    });
  }

  turnOn(String id) async {
    await district.doc(id).update({
      "status" : true
    });
  }

  Stream<QuerySnapshot> allDistrictStream() {
    return district.snapshots();
  }
  Future<QuerySnapshot> cityDistrictList(String cityName) {
    return district.where("city", isEqualTo: cityName).get();
  }
}