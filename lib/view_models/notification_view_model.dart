import '../models/notification_list_model.dart';
import '../services/interfaces/firebase_service_interface.dart';
import '../services/service_locator.dart';

class NotiViewModel {
  NotiViewModel();
  final _firebaseService = locator<IFirebaseService>();
  List<NotiData> notiList = [];

  Future<void> _initialize() async {
    var allNotiList = await _firebaseService.getNotifications();
    print('initList');

    if (allNotiList != null) {
      // ignore: avoid_function_literals_in_foreach_calls
      allNotiList.forEach((mapData) {
        notiList.add(NotiData(map: mapData));
        sortBy("patientSeen", true);
      });
    }
  }

  Future<List<NotiData>> getUsers() async {
    notiList.clear();
    await _initialize();
    // ignore: avoid_function_literals_in_foreach_calls
    notiList.forEach((element) {});
    return notiList;
  }

  // ignore: avoid_positional_boolean_parameters
  List<NotiData> sortBy(String key, bool isAsc) {
    switch (key) {
      case 'patientSeen':
        notiList
            .sort((a, b) => a.formDateTimeSort.compareTo(b.formDateTimeSort));
        notiList.sort((a, b) => b.patientSeen.compareTo(a.patientSeen));
        break;
    }
    if (isAsc) {
      notiList = notiList.reversed.toList();
    }

    return notiList;
  }
}
