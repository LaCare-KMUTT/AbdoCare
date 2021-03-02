import '../services/interfaces/firebase_service_interface.dart';
import '../services/service_locator.dart';

class AppointmentList {
  List<Map<String, dynamic>> _appointmentList = [];
  final IFirebaseService _firebaseService = locator<IFirebaseService>();

  AppointmentList();

  static Future<AppointmentList> create() async {
    var instance = AppointmentList();
    await instance._getAppointmentsFromDb();
    return instance;
  }

  void _getAppointmentsFromDb() async {
    _appointmentList = await _firebaseService.getAppointments();
    print('OMG ${this._appointmentList}');
  }

  Future<List<Map<String, dynamic>>> getAppointmentList() async {
    print('This is AppointmentList Model $_appointmentList');
    return await _appointmentList;
  }
}
