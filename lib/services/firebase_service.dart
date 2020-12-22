import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseService {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  Future<String> _getUserByUniqueId(String uniqueKey) async {
    var username;
    var searchedUserId = await _firestore
        .collection('Users')
        .where('uniqueKey', isEqualTo: uniqueKey)
        .get();
    if (searchedUserId.size != 0) {
      var document = searchedUserId.docs.first;
      var userId = document.id;
      username = await _firestore
          .collection('Users')
          .doc(userId)
          .get()
          .then((user) => user.get('username'))
          .catchError((e) {
        print('Failed to find username');
        return null;
      });
    } else {
      print('can\'t find user id');
      username = null;
    }
    return username;
  }

  Future<bool> login(String uniqueKey) async {
    var username = await _getUserByUniqueId(uniqueKey);
    var loginResult = await _auth
        .signInWithEmailAndPassword(email: username, password: uniqueKey)
        .then((value) {
      print('${value.user.uid} has logined!');
      return true;
    }).catchError((e) {
      print('error: $e');
      return false;
    });
    print('$loginResult Login is working ? ');
    return loginResult;
  }

  Future<void> signout() async {
    if (_auth.currentUser != null) {
      await _auth.signOut();
      print('Firebase user : ${_auth.currentUser} has signed out');
    }
  }

  String getUserId() => _auth.currentUser.uid;

  Stream<DocumentSnapshot> getCollectionSnapshotByDocId(
          {@required String collection, @required String docId}) =>
      _firestore.collection(collection).doc(docId).snapshots();

  Future<String> getAStringValueFormField(
          {@required String collection,
          @required String docId,
          @required String field}) async =>
      await _firestore
          .collection(collection)
          .doc(docId)
          .get()
          .then((value) => value.get(field));

  void updateFieldCollection(
      {@required String collection,
      @required String docId,
      @required Map<String, dynamic> updateField}) {
    print('here is updateFieldCollection');
    print(collection);
    print(docId);
    print(updateField);
    _firestore
        .collection(collection)
        .doc(docId)
        .update(updateField)
        .then((value) => {print('update pin success')})
        .catchError((onError) {
      print('error update password');
    });
  }
}
