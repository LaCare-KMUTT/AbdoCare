import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../stores/user_store.dart';
import 'interfaces/calculation_service_interface.dart';
import 'interfaces/firebase_service_interface.dart';
import 'service_locator.dart';

class FirebaseService extends IFirebaseService {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  final ICalculationService _calculationService =
      locator<ICalculationService>();

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

  Future<bool> signIn({
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

  Future<void> signOut() async {
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

  Future<String> getAStringValueFromField(
          {@required String collection,
          @required String docId,
          @required String field}) async =>
      await _firestore
          .collection(collection)
          .doc(docId)
          .get()
          .then((value) => value.get(field));

  Future<Map<String, dynamic>> getCollectionMapByDocId(
          {@required String collection, @required String docId}) async =>
      await _firestore
          .collection(collection)
          .doc(docId)
          .get()
          .then((value) => value.data());

  Future<void> updateDataToCollectionField(
      {@required String collection,
      @required String docId,
      @required Map<String, dynamic> updateField}) async {
    await _firestore
        .collection(collection)
        .doc(docId)
        .update(updateField)
        .then((value) => {print('update field ${updateField.keys} success')})
        .catchError((onError) {
      print('error update $updateField');
    });
  }

  Future<void> updateFieldToSubCollection({
    @required String collection,
    @required String docId,
    @required String subCollection,
    @required String subCollectionDoc,
    @required Map<String, dynamic> data,
  }) async {
    await _firestore
        .collection(collection)
        .doc(docId)
        .collection(subCollection)
        .doc(subCollectionDoc)
        .update(data)
        .then((value) {
      print('success update data $data to collection $collection ');
      print('docId = $docId, $subCollection $subCollectionDoc');
    }).catchError((onError) {
      print(
          '''$onError Failed on update $data to $collection $docId $subCollection $subCollectionDoc''');
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

  Future<DocumentReference> addDocumentToCollection({
    @required String collection,
    @required Map<String, dynamic> docData,
  }) async {
    var doc = await _firestore.collection(collection).add(docData).then((doc) {
      print('Success add $docData to $collection collection');
      return doc;
    }).catchError((onError) {
      print('Failed to add $docData to $collection collection');
      return null;
    });
    return doc;
  }

  Future<Map<String, dynamic>> getSubCollectionMap(
      {@required String collection,
      @required String docId,
      @required String subCollection,
      @required String subDocId}) {
    var subCollectionMap = _firestore
        .collection(collection)
        .doc(docId)
        .collection(subCollection)
        .doc(subDocId)
        .get()
        .then((value) => value.data());
    return subCollectionMap;
  }

  Future<String> addDataToFormsCollection({
    @required String formName,
    @required Map<String, dynamic> data,
  }) async {
    var storedUserId = UserStore.getValueFromStore('storedUserId');
    var storedLatestAnId = UserStore.getValueFromStore('storedLatestAnId');
    var anSubCollection = await this.getSubCollectionMap(
        collection: 'Users',
        docId: storedUserId,
        subCollection: 'an',
        subDocId: storedLatestAnId);
    var patientState = anSubCollection['state'];
    var an = anSubCollection['an'];
    var creator =
        '''${UserStore.getValueFromStore('storedName')} ${UserStore.getValueFromStore('storedSurname')}''';
    var creation = _calculationService.formatDate(date: DateTime.now());
    Map<String, dynamic> dataToAdd = {
      'an': an,
      'hn': UserStore.getValueFromStore('storedHn'),
      'creation': creation,
      'formName': formName,
      'creator': creator,
      'patientState': patientState,
      'formData': data,
    };

    print('Here is data to add $dataToAdd');
    var forms = await this
        .addDocumentToCollection(collection: 'Forms', docData: dataToAdd);
    var formsId = forms.id;
    await _firestore
        .collection('Users')
        .doc(UserStore.getValueFromStore('storedUserId'))
        .collection('an')
        .doc(storedLatestAnId)
        .update({
          'forms': FieldValue.arrayUnion([
            {
              'formId': formsId,
              'formName': formName,
              'formCreation': creation,
            }
          ]),
        })
        .then(
            (value) => print('success adding forms things to an subCollection'))
        .catchError((onError) {
          print('$onError on adding forms things to an subCollection');
        });
    return formsId;
  }

  void saveDataToSharedPref() async {
    var userId = this.getUserId();
    var hn = await _firestore
        .collection('Users')
        .doc(userId)
        .get()
        .then((value) => value.get('hn'));

    var name = await _firestore
        .collection('Users')
        .doc(userId)
        .get()
        .then((value) => value.get('name'));

    var surname = await _firestore
        .collection('Users')
        .doc(userId)
        .get()
        .then((value) => value.get('surname'));

    var latestAn = await _firestore
        .collection('Users')
        .doc(userId)
        .get()
        .then((value) => value.get('an'));
    var length = latestAn.length;
    Map<String, dynamic> data = {
      'storedUserId': userId,
      'storedHn': hn,
      'storedName': name,
      'storedSurname': surname,
      'storedLatestAnId': latestAn[length - 1]['an'],
    };
    print(data);
    UserStore.setDataToStore(data: data);
  }

  Future<List<Map<String, dynamic>>> getAppointments() async {
    var storedHn = UserStore.getValueFromStore('storedHn');
    print('storedHn in getAppointmentList $storedHn');
    var querySnapshot = await _firestore
        .collection('Appointments')
        .where('hn', isEqualTo: storedHn)
        .get()
        .then((value) => value.docs)
        .catchError((onError) {
      print('$onError error in getAppointments');
    });
    var map = querySnapshot.map((doc) => doc.data()).toList();
    print('Map in getAppointments $map');
    return map;
  }

  Future<void> addNotification(Map<String, dynamic> data) async {
    await _firestore
        .collection('Notifications')
        .add(data)
        .then((value) =>
            print('Successfully added $value to Notificaitons Collection'))
        .catchError((e) {
      print('$e failed to add notification to Notifications Collection');
    });
  }

  Future<List<Map<String, dynamic>>> getNotifications() async {
    var storedUserId = UserStore.getValueFromStore('storedUserId');
    print('storedUserId in getNotificationList $storedUserId');
    var querySnapshot = await _firestore
        .collection('Notifications')
        .where('userId', isEqualTo: storedUserId)
        .get()
        .then((value) => value.docs)
        .catchError((onError) {
      print('$onError error in getnotification');
    });
    var map = querySnapshot.map((doc) {
      return doc.data();
    }).toList();
    print('Map in Notification $map');
    return map;
  }
}
