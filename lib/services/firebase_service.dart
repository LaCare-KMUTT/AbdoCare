import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../@enum/patient_state.dart';
import '../models/formname_model.dart';
import '../stores/user_store.dart';
import 'interfaces/calculation_service_interface.dart';
import 'interfaces/firebase_service_interface.dart';
import 'service_locator.dart';

class FirebaseService extends IFirebaseService {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  final ICalculationService _calculationService =
      locator<ICalculationService>();

  Future<bool> signIn({
    @required String hn,
    @required String uniqueKey,
  }) async {
    var loginResult = await _auth
        .signInWithEmailAndPassword(
            email: '$hn@abdocare.com', password: uniqueKey)
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

  Future<void> addNotification(
      {@required String userId,
      @required String formId,
      @required String formName}) async {
    var creation = _calculationService.formatDate(date: DateTime.now());
    var anSubCollection = await getLatestAnSubCollection(userId: userId);
    var patientState = anSubCollection['state'];
    Map<String, dynamic> dataToAdd = {
      'formName': formName,
      'formId': formId,
      'userId': userId,
      'creation': creation,
      'patientState': patientState,
      'seen': false,
      'patientSeen': false,
    };
    await _firestore
        .collection('Notifications')
        .add(dataToAdd)
        .then((value) =>
            print('Successfully added $value to Notificaitons Collection'))
        .catchError((e) {
      print('$e failed to add notification to Notifications Collection');
    });
  }

  Future<List<QueryDocumentSnapshot>> getNotificationList() async {
    var data;
    var storedUserId = UserStore.getValueFromStore('storedUserId');
    var anSubcollection = await getLatestAnSubCollection(userId: storedUserId);
    var patientState = anSubcollection["state"];
    var checkState = enumToString(PatientState.postOperationHome);
    if (patientState == checkState) {
      data = await _firestore
          .collection('Notifications')
          .where('userId', isEqualTo: storedUserId)
          .where('seen', isEqualTo: true)
          .get();
    } else {
      data = await _firestore
          .collection('Notifications')
          .where('userId', isEqualTo: storedUserId)
          .get();
    }
    return data.docs;
  }

  Future<List<Map<String, dynamic>>> getNotifications() async {
    var notiList = await this.getNotificationList();
    var returnList = notiList.map((user) async {
      var notiCollection =
          await _firestore.collection("Notifications").doc(user.id).get();
      var seen = notiCollection['seen'];
      if (seen == false) {
        seen = "ยังไม่ได้ดำเนินการ";
      } else {
        seen = "ดำเนินการแล้ว";
      }
      var patientState = notiCollection['patientState'];
      var formName = notiCollection['formName'];
      formName = formNameModel[formName];
      var time = notiCollection['creation'];
      var formTime =
          DateTime.fromMicrosecondsSinceEpoch(time.microsecondsSinceEpoch);
      var formDateToShow = DateFormat('dd/MM/yyyy').format(formTime);
      var formTimeToShow = "${DateFormat.Hm().format(formTime)} น.";

      var patientSeen = notiCollection['patientSeen'] ?? '-';
      if (patientSeen == false) {
        patientSeen = "ยังไม่ได้อ่าน";
      } else {
        patientSeen = "อ่านแล้ว";
      }
      var map = {
        'patientState': patientState ?? '-',
        'formName': formName ?? '-',
        'formTime': formTimeToShow ?? '-',
        'formDate': formDateToShow ?? '-',
        'formDateTimeSort': formTime ?? '-',
        'seen': seen ?? '-',
        'imgURL': '-',
        'advice': '-',
        'severity': '-',
        'notiId': user.id ?? '-',
        'patientSeen': patientSeen ?? '-',
      };
      if (patientState == "Post-Operation@Home") {
        var imgURL = notiCollection['imgURL'] ?? '-';
        var advice = notiCollection['advice'] ?? '-';
        var severity = notiCollection['severity'] ?? '-';
        map.addAll({
          'imgURL': imgURL ?? '-',
          'advice': advice ?? '-',
          'severity': severity ?? '-',
        });
      }
      return map;
    });
    var futureList = Future.wait(returnList);
    var returnValue = await futureList;
    if (returnValue != null) {
      returnValue.removeWhere((element) => element == null);
    }
    return returnValue;
  }

  Future<int> getNoticounter() async {
    int count = 0;
    var notiList = await this.getNotificationList();
    var returnList = notiList.map((user) async {
      var notiCollection =
          await _firestore.collection("Notifications").doc(user.id).get();
      var patientSeen = notiCollection['patientSeen'] ?? '-';
      if (patientSeen == false) {
        count = count + 1;
      }
      return count;
    });
    var futureList = Future.wait(returnList);
    var returnValue = await futureList;
    count = returnValue.first;
    return count;
  }
}
