import 'package:flutter/material.dart';

import '../services/interfaces/firebase_service_interface.dart';
import '../services/service_locator.dart';

class PinViewModel {
  PinViewModel();

  final IFirebaseService _firebaseService = locator<IFirebaseService>();

  Future<String> _getPasscode() async {
    var uid = _firebaseService.getUserId();
    print('UID IN pin_page $uid');
    var passcode = await _firebaseService.getAStringValueFromField(
        collection: 'Users', docId: uid, field: 'password');
    return passcode;
  }

  Future<bool> checkPin(String pin) async {
    var passcode = await _getPasscode();
    print('this is passcode :$passcode');
    if (passcode == pin) {
      print('$pin equal passcode');
      print('passcode : $passcode');
      return true;
    } else {
      print('wrong passcode : $pin');
      print('correct is : $passcode');
      return false;
    }
  }

  void setPin({@required String strPin}) {
    _firebaseService.updateDataToCollectionField(
        collection: 'Users',
        docId: _firebaseService.getUserId(),
        updateField: {'password': strPin});
  }
}
