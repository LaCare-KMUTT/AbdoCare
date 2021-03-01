import 'package:cloud_firestore/cloud_firestore.dart';

import '../services/interfaces/firebase_service_interface.dart';
import '../services/service_locator.dart';

class ProfileModel {
  final IFirebaseService _firebaseService = locator<IFirebaseService>();

  var _userId;

  ProfileModel() {
    _userId = _firebaseService.getUserId();
  }

  Stream<DocumentSnapshot> getUserProfileSnapshot() {
    return _firebaseService.getCollectionSnapshotByDocId(
        collection: 'Users', docId: _userId);
  }

  Future<Map<String, dynamic>> getAnProfileMap() {
    return _firebaseService.getLatestAnSubCollection(userId: _userId);
  }
}
