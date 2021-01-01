import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'interfaces/firebase_service_interface.dart';

class FirebaseService extends IFirebaseService {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  Future<String> _getUsernameByHnAndKey(String hn, String uniqueKey) async {
    var username;
    var searchedUserId = await _firestore
        .collection('Users')
        .where('uniqueKey', isEqualTo: uniqueKey)
        .where('hn', isEqualTo: hn)
        .get();
    if (searchedUserId.size != 0) {
      var document = searchedUserId.docs.first;
      var userId = document.id;
      username = await _firestore
          .collection('Users')
          .doc(userId)
          .get()
          .then((user) => user.get('username'))
          .catchError((onError) {
        print('$onError Failed to find username');
        return null;
      });
    } else {
      print('can\'t find user id');
      username = null;
    }
    return username;
  }

  Future<bool> login({
    @required String hn,
    @required String uniqueKey,
  }) async {
    var username = await _getUsernameByHnAndKey(hn, uniqueKey);
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
      var signingOutUserId = _auth.currentUser.uid;
      await _auth.signOut();
      print('Firebase user : $signingOutUserId has signed out');
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
        .then((value) => {print('update field ${updateField.keys} success')})
        .catchError((onError) {
      print('error update password');
    });
  }

  Future<Map<String, dynamic>> getLatestAnSubCollection({
    @required String userId,
  }) async {
    var anSubCollection = await _firestore
        .collection('Users')
        .doc(userId)
        .collection('an')
        .orderBy('operationDate', descending: true)
        .limit(1)
        .get()
        .then((querySnapshot) => querySnapshot.docs.first.data());
    return anSubCollection;
  }
}
