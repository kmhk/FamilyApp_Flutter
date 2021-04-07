import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:family/app.dart';

class DepartmentService{

  CollectionReference department = firestore.collection('departments');

  addDepartment(String departmentName,String imageUrl) async {
    await department.doc().set({
      "department" : departmentName,
      "imageUrl" : imageUrl,
      "status" : true
    });
  }

  removeDepartment(String id) async {
    await department.doc(id).delete();
  }

  editDepartment(String id,String departmentName,String imageUrl) async {
    await department.doc(id).update({
      "department" : departmentName,
      "imageUrl" : imageUrl,
    });
  }

  turnOff(String id) async {
    await department.doc(id).update({
      "status" : false
    });
  }

  turnOn(String id) async {
    await department.doc(id).update({
      "status" : true
    });
  }

  Stream<QuerySnapshot> departmentsStream() {
    return department.snapshots();
  }

  Future<QuerySnapshot> departmentsList() {
    return department.get();
  }




}