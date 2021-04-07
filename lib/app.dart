import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:family/Services/families_service.dart';
import 'package:family/Services/order_service.dart';
import 'package:family/Services/storage_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Services/auth_services.dart';
import 'Services/cities_service.dart';
import 'Services/department_service.dart';
import 'Services/district_service.dart';
import 'Services/product_service.dart';
import 'Services/subscription_services.dart';

FirebaseAuth firebaseAuth = FirebaseAuth.instance;
FirebaseFirestore firestore = FirebaseFirestore.instance;
FirebaseStorage storage = FirebaseStorage.instance;

AuthService authService = AuthService();
CitiesService citiesService = CitiesService();
DistrictService districtService = DistrictService();
StorageService storageService = StorageService();
DepartmentService departmentService = DepartmentService();
ProductService productService = ProductService();
FamiliesService familiesService = FamiliesService();
OrderService orderService = OrderService();
SubscriptionService subscriptionService = SubscriptionService();


SharedPreferences prefs;


class App{
  String appName = "Osrah Station Family";
}