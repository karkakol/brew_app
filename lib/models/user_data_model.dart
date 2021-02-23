import 'package:flutter/material.dart';

class UserData {
  final String uid;
  final String name;
  final String sugars;
  final int strength;

  UserData({
    @required this.uid,
    @required this.name,
    @required this.sugars,
    @required this.strength,
  });

  UserData fromMap(Map<String, dynamic> map, String uid) {
    return UserData(
      uid: uid,
      name: map['name'],
      strength: map['strength'],
      sugars: map['sugars'],
    );
  }
}
