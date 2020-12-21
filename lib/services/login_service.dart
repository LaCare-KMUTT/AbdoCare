import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginService {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  Future<String> _getUserByUniqueId(String uniqueKey) async {
    var username;
    var searchedUserId = await _firestore
        .collection('Users')
        .where('uniqueKey', isEqualTo: uniqueKey)
        .get();
    if (searchedUserId.size != 0) {
      var document = searchedUserId.docs.first;
      var userId = document.id;
      username = await _firestore
          .collection('Users')
          .doc(userId)
          .get()
          .then((user) => user.get('username'))
          .catchError((e) {
        print('Failed to find username');
        return null;
      });
    } else {
      print('can\'t find user id');
      username = null;
    }
    return username;
  }

  Future<bool> login(String uniqueKey) async {
    var username = await _getUserByUniqueId(uniqueKey);
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
}
