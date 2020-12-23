import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

abstract class IFirebaseService {
  Future<bool> login(String uniqueKey);
  Future<void> signout();
  String getUserId();
  Stream<DocumentSnapshot> getCollectionSnapshotByDocId(
      {@required String collection, @required String docId});
  Future<String> getAStringValueFormField(
      {@required String collection,
      @required String docId,
      @required String field});
  void updateFieldCollection(
      {@required String collection,
      @required String docId,
      @required Map<String, dynamic> updateField});
}
