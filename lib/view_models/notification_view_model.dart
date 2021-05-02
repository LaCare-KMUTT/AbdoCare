import '../models/notification_list_model.dart';
import '../services/interfaces/firebase_service_interface.dart';
import '../services/service_locator.dart';

class NotiViewModel {
  NotiViewModel();
  final _firebaseService = locator<IFirebaseService>();
  List<NotiData> userList = [];

  Future<void> _initialize() async {
    var allNotiList = await _firebaseService.getNotifications();
    print('initList');

    if (allNotiList != null) {
      // ignore: avoid_function_literals_in_foreach_calls
      allNotiList.forEach((mapData) {
        userList.add(NotiData(map: mapData));
        sortBy("DateTimeSort", true);
      });
    }
  }

  Future<List<NotiData>> getUsers() async {
    userList.clear();
    await _initialize();
    // ignore: avoid_function_literals_in_foreach_calls
    userList.forEach((element) {});
    return userList;
  }

  // ignore: avoid_positional_boolean_parameters
  List<NotiData> sortBy(String key, bool isAsc) {
    switch (key) {
      case 'DateTimeSort':
        userList
            .sort((a, b) => a.formDateTimeSort.compareTo(b.formDateTimeSort));
        break;
    }
    if (isAsc) {
      userList = userList.reversed.toList();
    }

    return userList;
  }
}
