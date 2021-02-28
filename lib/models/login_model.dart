import '../services/interfaces/firebase_service_interface.dart';
import '../services/service_locator.dart';

class LoginModel {
  LoginModel();
  String hn;
  String password;
  bool validateUniqueKey;
  bool validateHn;
  final int _passwordLength = 6;
  final int _hnLength = 7;
  final IFirebaseService _firebaseService = locator<IFirebaseService>();

  Future<bool> signIn() async {
    if (await _firebaseService.signIn(hn: hn, uniqueKey: password)) {
      return true;
    } else {
      return false;
    }
  }

  void checkUniqueKey() {
    if (password.isEmpty || password.length != _passwordLength) {
      validateUniqueKey = true;
    } else {
      validateUniqueKey = false;
    }
  }

  void checkHn() {
    if (hn.isEmpty || hn.length != _hnLength) {
      validateHn = true;
    } else {
      validateHn = false;
    }
  }
}
