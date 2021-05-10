import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../@enum/patient_state.dart';
import '../models/formName_model.dart';
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
    var returnValue;
    var notiList = await this.getNotificationList();
    var returnList = notiList.map((user) async {
      var notiCollection =
          await _firestore.collection("Notifications").doc(user.id).get();
      var patientState = notiCollection['patientState'];
      var formName = notiCollection['formName'];
      formName = formNameModel[formName];
      var time = notiCollection['creation'];
      var formTime =
          DateTime.fromMicrosecondsSinceEpoch(time.microsecondsSinceEpoch);
      var formDateToShow = DateFormat('dd/MM/yyyy').format(formTime);
      var formTimeToShow = "${DateFormat.Hm().format(formTime)} น.";
      var patientSeen = notiCollection['patientSeen'] ?? false;
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
        'imgURL': '-',
        'advice': '-',
        'severity': 0,
        'notiId': user.id ?? '-',
        'patientSeen': patientSeen ?? 'ยังไม่ได้อ่าน',
      };
      if (patientState == "Post-Operation@Home") {
        var imgURL = notiCollection['imgURL'] ?? '-';
        var advice = notiCollection['advice'] ?? '-';
        var severity = notiCollection['severity'] ?? 0;
        map.addAll({
          'imgURL': imgURL ?? '-',
          'advice': advice ?? '-',
          'severity': severity ?? 0
        });
      }
      return map;
    });
    var futureList = Future.wait(returnList);
    returnValue = await futureList;
    return returnValue;
  }

  Future<int> getNotiCounter() async {
    int count = 0;
    var notiList = await this.getNotificationList();
    if (notiList.isNotEmpty) {
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
    } else {
      count = 0;
    }
    return count;
  }

  Future<List> getFormListInAnBasedOnState(
      {@required String userId,
      @required String patientState,
      @required String formName}) async {
    var anSubCollection = await _firestore
        .collection('Users')
        .doc(userId)
        .collection('an')
        .orderBy('operationDate', descending: true)
        .where('state', isEqualTo: patientState)
        .get()
        .catchError((onError) {
      print('$onError Error in getFormListInAnBasedOnState!');
    });
    List userForm;
    try {
      userForm = anSubCollection.docs.first.get('forms');
      // ignore: avoid_catches_without_on_clauses
    } catch (error) {
      userForm = null;
    }

    List list = [];
    if (userForm != null) {
      // ignore: avoid_function_literals_in_foreach_calls
      userForm.forEach((form) {
        if (form['formName'] == formName) {
          list.add(form);
        }
      });
    } else {
      print('userForm = null');
    }
    return list;
  }

  Future<String> getEvaluationStatus(
      {@required String formName, @required String patientState}) async {
    var formCreation;
    var evaluationStatus;
    var formDateToShow;
    var dateCompare;
    var formTime;
    var dateToCompare;
    var formStatus = await getFormListInAnBasedOnState(
        userId: UserStore.getValueFromStore('storedUserId'),
        patientState: patientState,
        formName: formName);
    if (formStatus.isNotEmpty) {
      var formsCollection = await _firestore
          .collection('Forms')
          .doc(formStatus.last['formId'])
          .get()
          .then((value) => value.data())
          .catchError((onError) {
        print('$onError no formsCollection');
      });
      formCreation = formsCollection['creation'] ?? '-';
      formTime = DateTime.fromMicrosecondsSinceEpoch(
          formCreation.microsecondsSinceEpoch);
      formDateToShow = DateFormat('yyyy-MM-dd').format(formTime);
      dateToCompare = _calculationService.formatDate(date: DateTime.now());
      dateCompare = DateFormat('yyyy-MM-dd').format(dateToCompare);
      if (formDateToShow == dateCompare) {
        evaluationStatus = "completed";
      }
    } else {
      evaluationStatus = "notCompleted";
    }
    return evaluationStatus;
  }

  Future<Map<dynamic, dynamic>> getLastFormId(
      {@required String formName,
      @required String patientState,
      @required String hn}) async {
    var mapData = {};
    var formId = await _firestore
        .collection('Forms')
        .where('hn', isEqualTo: hn)
        .where('formName', isEqualTo: formName)
        .where('patientState', isEqualTo: patientState)
        .get()
        .then((value) => value.docs.last.id)
        .catchError((onError) {});
    if (formId != null) {
      await _firestore.collection('Forms').doc(formId).get().then((value) {
        mapData.addAll(value.data());
      }).catchError((onError) {
        print('$onError Cann\'t find $formName form');
      });
    }
    return mapData;
  }

  Future<Map<String, dynamic>> getAdlTable() async {
    var storedHn = UserStore.getValueFromStore('storedHn');
    var preOpAdlData = await getLastFormId(
        formName: 'ADL', hn: storedHn, patientState: 'Pre-Operation');
    var postHosData = await getLastFormId(
        formName: 'ADL', hn: storedHn, patientState: 'Post-Operation@Hospital');
    var postHomeData = await getLastFormId(
        formName: 'ADL', hn: storedHn, patientState: 'Post-Operation@Home');
    var map = {
      'PreOpGrooming':
          preOpAdlData.length != 0 ? preOpAdlData['formData']['Grooming'] : 2,
      'PreOpBathing':
          preOpAdlData.length != 0 ? preOpAdlData['formData']['Bathing'] : 2,
      'PreOpFeeding':
          preOpAdlData.length != 0 ? preOpAdlData['formData']['Feeding'] : 3,
      'PreOpToilet':
          preOpAdlData.length != 0 ? preOpAdlData['formData']['Toilet'] : 3,
      'PreOpDressing':
          preOpAdlData.length != 0 ? preOpAdlData['formData']['Dressing'] : 3,
      'PreOpStairs':
          preOpAdlData.length != 0 ? preOpAdlData['formData']['Stairs'] : 3,
      'PreOpBowels':
          preOpAdlData.length != 0 ? preOpAdlData['formData']['Bowels'] : 3,
      'PreOpBladder':
          preOpAdlData.length != 0 ? preOpAdlData['formData']['Bladder'] : 3,
      'PreOpTransfer':
          preOpAdlData.length != 0 ? preOpAdlData['formData']['Transfer'] : 4,
      'PreOpMobility':
          preOpAdlData.length != 0 ? preOpAdlData['formData']['Mobility'] : 4,
      'PreOpTotal': preOpAdlData.length != 0
          ? preOpAdlData['formData']['TotalScoreADL']
          : 0,
      'PostHosGrooming':
          postHosData.length != 0 ? postHosData['formData']['Grooming'] : 2,
      'PostHosBathing':
          postHosData.length != 0 ? postHosData['formData']['Bathing'] : 2,
      'PostHosFeeding':
          postHosData.length != 0 ? postHosData['formData']['Feeding'] : 3,
      'PostHosToilet':
          postHosData.length != 0 ? postHosData['formData']['Toilet'] : 3,
      'PostHosDressing':
          postHosData.length != 0 ? postHosData['formData']['Dressing'] : 3,
      'PostHosStairs':
          postHosData.length != 0 ? postHosData['formData']['Stairs'] : 3,
      'PostHosBowels':
          postHosData.length != 0 ? postHosData['formData']['Bowels'] : 3,
      'PostHosBladder':
          postHosData.length != 0 ? postHosData['formData']['Bladder'] : 3,
      'PostHosTransfer':
          postHosData.length != 0 ? postHosData['formData']['Transfer'] : 4,
      'PostHosMobility':
          postHosData.length != 0 ? postHosData['formData']['Mobility'] : 4,
      'PostHosTotal': postHosData.length != 0
          ? postHosData['formData']['TotalScoreADL']
          : 0,
      'PostHomeGrooming':
          postHomeData.length != 0 ? postHomeData['formData']['Grooming'] : 2,
      'PostHomeBathing':
          postHomeData.length != 0 ? postHomeData['formData']['Bathing'] : 2,
      'PostHomeFeeding':
          postHomeData.length != 0 ? postHomeData['formData']['Feeding'] : 3,
      'PostHomeToilet':
          postHomeData.length != 0 ? postHomeData['formData']['Toilet'] : 3,
      'PostHomeDressing':
          postHomeData.length != 0 ? postHomeData['formData']['Dressing'] : 3,
      'PostHomeStairs':
          postHomeData.length != 0 ? postHomeData['formData']['Stairs'] : 3,
      'PostHomeBowels':
          postHomeData.length != 0 ? postHomeData['formData']['Bowels'] : 3,
      'PostHomeBladder':
          postHomeData.length != 0 ? postHomeData['formData']['Bladder'] : 3,
      'PostHomeTransfer':
          postHomeData.length != 0 ? postHomeData['formData']['Transfer'] : 4,
      'PostHomeMobility':
          postHomeData.length != 0 ? postHomeData['formData']['Mobility'] : 4,
      'PostHomeTotal': postHomeData.length != 0
          ? postHomeData['formData']['TotalScoreADL']
          : 0,
    };
    return map;
  }

  Future<void> addToDashboardCollection(Map<String, dynamic> data) async {
    await _firestore.collection('Dashboards').add(data).then((value) {
      print("Add $data to Dashboard Collection");
    });
  }

  Future<List<Map<String, dynamic>>> getDashboardGraph() async {
    var storedUserId = UserStore.getValueFromStore('storedUserId');
    var anSubcollection = await getLatestAnSubCollection(userId: storedUserId);
    var patientState = anSubcollection["state"];
    var fieldName;
    if (patientState == "Post-Operation@Home") {
      fieldName = 'painGraph';
    } else {
      fieldName = 'dashboardTable';
    }
    var dashboardsCollection = await _firestore
        .collection('Dashboards')
        .orderBy('Date')
        .where('hn', isEqualTo: UserStore.getValueFromStore('storedHn'))
        .where('name', isEqualTo: fieldName)
        .get()
        .then((value) {
      return value.docs;
    }).catchError((onError) {
      print('Error in getDashboardGraph = $onError');
    });
    List<Map<String, dynamic>> list = [];
    dashboardsCollection.forEach((element) {
      Map<String, dynamic> data = element.data();
      list.add(data);
    });
    return list;
  }
}
