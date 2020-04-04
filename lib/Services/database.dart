import 'package:aim/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';

class DataBaseServices {
  final String uid;
  var userdetails = Firestore.instance.collection("users").document("uid");

  var communitydetails =
      Firestore.instance.collection("communities").document("uid");
  FirebaseMessaging _messaging = FirebaseMessaging();
  DataBaseServices({this.uid});

  final CollectionReference _userdoc = Firestore.instance.collection('users');
  final CollectionReference _communitydoc =
      Firestore.instance.collection('communitites');

  Future userUpdateDatabase({
    String email,
    String password,
    String name,
    String token,
  }) async {
    _messaging.subscribeToTopic(token);

    return await _userdoc.document(uid).setData({
      'userId': uid,
      'email': email,
      'password': password,
      'name': name,
      'token': token
    });
  }

  // Future updateProfile(
  //     String name, String bloodGroup, String city, String state) async {
  //   return await _userdoc.document(uid).updateData(
  //     {
  //       'name': "Enter name",
  //       'bloodGroup': "Enter group",
  //       'city': "Enter City",
  //       'state': "Enter State",
  //     },
  //   );
  // }

  Future userUpdateToken(String token) async {
    return await _userdoc.document(uid).updateData(
      {
        "token": token,
      },
    );
  }

  Future communityUpdateDatabase(
      {String email,
      String password,
      String name,
      String city,
      String token,
      String address,
      String phonenumber,
      String state}) async {
    _messaging.subscribeToTopic(token);

    return await _communitydoc.document(uid).setData({
      'userId': uid,
      'email': email,
      'password': password,
      'name': name,
      'phonenumber': phonenumber,
      'address': address, 
      'city': city,
      'state': state,
      'token': token
    });
  }

  Future communityUpdateToken(String token) async {
    return await _communitydoc.document(uid).updateData(
      {
        "token": token,
      },
    );
  }
}
