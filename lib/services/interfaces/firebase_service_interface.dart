import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

abstract class IFirebaseService {
  Future<bool> signIn({@required String hn, @required String uniqueKey});

  Future<void> signOut();

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

  Future<Map<String, dynamic>> getLatestAnSubCollection({
    @required String userId,
  });

  Future<DocumentReference> addDocumentToCollection({
    @required String collection,
    @required Map<String, dynamic> docData,
  });
}
