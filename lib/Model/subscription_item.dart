
import 'package:cloud_firestore/cloud_firestore.dart';

class SubscriptionItem {
  SubscriptionItem({
    this.customerName,
    this.customerId,
    this.broadcast,
    this.orderStatus,
    this.meal,
    this.docId
  });

  String customerName;
  String customerId;
  String orderStatus;
  bool broadcast;
  String docId;
  List<Meal> meal;

  factory SubscriptionItem.fromJson(Map<String, dynamic> json, String id) => SubscriptionItem(
    customerName: json["customerName"],
    customerId: json["customerId"],
    orderStatus: json["orderStatus"],
    broadcast: json["broadcast"],
    docId: id,
    meal: List<Meal>.from(json["meal"].map((x) => Meal.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "customerName": customerName,
    "customerId": customerId,
    "broadcast": true,
    "orderStatus": 'pending',
    "meal": List<dynamic>.from(meal.map((x) => x.toJson())),
  };
}


class Meal {
  Meal({
    this.dateFrom,
    this.dateTo,
    this.description,
    this.type,
    this.days,
  });

  DateTime dateFrom;
  DateTime dateTo;
  String description;
  String type;
  List<String> days;

  factory Meal.fromJson(Map<String, dynamic> json) => Meal(
    dateFrom: DateTime.fromMillisecondsSinceEpoch(json["dateFrom"]),
    dateTo: DateTime.fromMillisecondsSinceEpoch(json["dateTo"]),
    description: json["description"],
    type: json["type"],
    days: List<String>.from(json["days"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "dateFrom": dateFrom.millisecondsSinceEpoch,
    "dateTo": dateTo.millisecondsSinceEpoch,
    "description": description,
    "type": type,
    "days": List<dynamic>.from(days.map((x) => x)),
  };
}
