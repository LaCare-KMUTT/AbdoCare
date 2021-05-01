import '../services/interfaces/firebase_service_interface.dart';
import '../services/service_locator.dart';

class NotificationList {
  List<Map<String, dynamic>> _notificationList = [];
  final IFirebaseService _firebaseService = locator<IFirebaseService>();

  NotificationList();

  static Future<NotificationList> create() async {
    var instance = NotificationList();
    await instance._getNotificationFromDb();
    return instance;
  }

  void _getNotificationFromDb() async {
    _notificationList = await _firebaseService.getNotifications();
  }

  Future<List<Map<String, dynamic>>> getNotificationList() async {
    return await _notificationList;
  }
}
