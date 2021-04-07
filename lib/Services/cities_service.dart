import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:family/app.dart';

class CitiesService {

  CollectionReference city = firestore.collection('cities');

  addCity(String cityName) async {
    await city.doc().set({
      "city" : cityName,
      "status" : true
    });
  }

  removeCity(String id) async {
    await city.doc(id).delete();
  }

  editCity(String id,String cityName) async {
    await city.doc(id).update({
      "city" : cityName
    });
  }

  turnOff(String id) async {
    await city.doc(id).update({
      "status" : false
    });
  }

  turnOn(String id) async {
    await city.doc(id).update({
      "status" : true
    });
  }

  Stream<QuerySnapshot> citiesStream() {
   return city.snapshots();
  }

  Future<QuerySnapshot> citiesList() {
    return city.get();
  }
}