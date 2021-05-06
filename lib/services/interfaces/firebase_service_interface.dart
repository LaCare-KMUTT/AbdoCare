import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

abstract class IFirebaseService {
  Future<bool> signIn({@required String hn, @required String uniqueKey});

  Future<void> signOut();

  String getUserId();

  Stream<DocumentSnapshot> getCollectionSnapshotByDocId(
      {@required String collection, @required String docId});

  Future<Map<String, dynamic>> getCollectionMapByDocId(
      {@required String collection, @required String docId});

  Future<String> getAStringValueFromField(
      {@required String collection,
      @required String docId,
      @required String field});

  void updateDataToCollectionField(
      {@required String collection,
      @required String docId,
      @required Map<String, dynamic> updateField});

  Future<void> updateFieldToSubCollection({
    @required String collection,
    @required String docId,
    @required String subCollection,
    @required String subCollectionDoc,
    @required Map<String, dynamic> data,
  });

  Future<Map<String, dynamic>> getLatestAnSubCollection({
    @required String userId,
  });

  Future<Map<String, dynamic>> getSubCollectionMap(
      {@required String collection,
      @required String docId,
      @required String subCollection,
      @required String subDocId});

  Future<DocumentReference> addDocumentToCollection({
    @required String collection,
    @required Map<String, dynamic> docData,
  });

  void saveDataToSharedPref();

  Future<String> addDataToFormsCollection({
    @required String formName,
    @required Map<String, dynamic> data,
  });

  Future<List<Map<String, dynamic>>> getAppointments();

  Future<void> addNotification(
      {@required String userId,
      @required String formId,
      @required String formName});

  Future<List<Map<String, dynamic>>> getNotifications();

  Future<int> getNotiCounter();

  Future<List> getFormListInAnBasedOnState(
      {@required String userId,
      @required String patientState,
      @required String formName});

  Future<String> getEvaluationStatus(
      {@required String formName, @required String patientState});
}
