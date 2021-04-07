import 'dart:core';
import 'dart:io';

import 'package:intl/intl.dart';

class SpecialModel{

  /// custom order

  String orderName;
  String orderDescription;

  /// buffet order

  String city;
  int people;
  String date;
  String time;
  String mainDish;
  String secondDish;
  String drink;
  String fruit;
  String other;

  /// common

  File attachment;
  String attachmentUrl;
  String type;
  String customerName;
  String customerId;
  String docId;
  DateTime createDateTime;
  String orderStatus;


  SpecialModel(
      {this.orderName,
        this.orderDescription,
        this.city,
        this.people,
        this.date,
        this.time,
        this.mainDish,
        this.secondDish,
        this.drink,
        this.fruit,
        this.other,
        this.attachment,
        this.type,
        this.customerName,
        this.customerId,
        this.attachmentUrl,
        this.docId,
        this.createDateTime,
        this.orderStatus
      });

  /// custom order

  factory SpecialModel.fromCustomOrderJson(Map<String, dynamic> data, String id) => SpecialModel(
    type: data['type'],
    orderName: data['orderName'],
    orderDescription: data['orderDescription'],
    customerId: data['customerId'],
    customerName: data['customerName'],
    attachmentUrl: data['attachmentUrl'],
    orderStatus: data['orderStatus'],
    createDateTime : DateTime.parse(data['createdDate']),
    docId: id,
  );

  Map<String, dynamic> toCustomOrderJson() => {
    'type' : type,
    'orderName' : orderName,
    'orderDescription' : orderDescription,
    'customerName' : customerName,
    'customerId' : customerId,
    'attachmentUrl' : attachmentUrl,
    'orderStatus' : "pending",
    'createdDate' : DateTime.now().toIso8601String()
  };

  /// custom order

  factory SpecialModel.fromBuffetJson(Map<String, dynamic> data, String id) => SpecialModel(
    type: data['type'],
    city: data['city'],
    people: data['people'],
    date: data['date'],
    time: data['time'],
    mainDish: data['mainDish'],
    secondDish: data['secondDish'],
    drink: data['drink'],
    customerId: data['customerId'],
    customerName: data['customerName'],
    fruit: data['fruit'],
    other: data['other'],
    attachmentUrl: data['attachmentUrl'],
    orderStatus: data['orderStatus'],
    createDateTime : DateTime.parse(data['createdDate']),
    docId: id,
  );

  Map<String, dynamic> toBuffetJson() => {
    'type' : type,
    'city' : city,
    'people' : people,
    'date' : date,
    'customerName' : customerName,
    'customerId' : customerId,
    'time' : time,
    'mainDish' : mainDish,
    'secondDish' : secondDish,
    'drink' : drink,
    'fruit' : fruit,
    'other' : other,
    'attachmentUrl' : attachmentUrl,
    'orderStatus' : "pending",
    'createdDate' : DateTime.now().toIso8601String()
  };
}