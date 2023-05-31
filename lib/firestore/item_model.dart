import 'package:cloud_firestore/cloud_firestore.dart';

class ItemModel {
  late String itemKey;
  late String userKey;
  late List<String> image;
  late String title;
  late String town;
  late String category;
  late String detail;
  late DateTime date;

  ItemModel({
    required this.itemKey,
    required this.userKey,
    required this.image,
    required this.title,
    required this.town,
    required this.category,
    required this.detail,
    required this.date,});

  ItemModel.fromJson(Map<String, dynamic> json, this.itemKey,) {
    // itemKey = json['itemKey']??"";
    userKey = json['userKey']??"";
    image = json['image'] != null ? json['image'].cast<String>() : [];
    title = json['title']??"";
    town = json['town']??"";
    category = json['category']??"";
    detail = json['detatil']??"";
    date = json['data']??"";
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    // map['itemKey'] = itemKey;
    map['userKey'] = userKey;
    map['image'] = image;
    map['title'] = title;
    map['town'] = town;
    map['category'] = category;
    map['detatil'] = detail;
    map['data'] = date;
    return map;
  }
}