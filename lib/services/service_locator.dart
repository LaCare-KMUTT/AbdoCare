import 'package:get_it/get_it.dart';
import '../models/chat_model.dart';
import '../models/evaluation_model.dart';
import '../models/login_model.dart';
import '../models/message_model.dart';
import '../models/profile_model.dart';
import '../models/training_model.dart';
import '../view_models/evaluation_view_model.dart';
import '../view_models/notification_view_model.dart';
import '../view_models/pin_view_model.dart';
import '../view_models/training_view_model.dart';
import 'calculation_service.dart';
import 'firebase_service.dart';
import 'interfaces/calculation_service_interface.dart';
import 'interfaces/firebase_service_interface.dart';
import 'interfaces/storage_service_interface.dart';
import 'storage_service.dart';

GetIt locator = GetIt.instance;

void setupServiceLocator() {
  locator.registerLazySingleton<IFirebaseService>(() => FirebaseService());
  locator
      .registerLazySingleton<ICalculationService>(() => CalculationService());
  locator.registerLazySingleton<IStorageService>(() => StorageService());
  locator.registerLazySingleton<Chat>(() => Chat());
  locator.registerLazySingleton<MessageModel>(() => MessageModel());
  locator.registerLazySingleton<LoginModel>(() => LoginModel());
  locator.registerLazySingleton<PinViewModel>(() => PinViewModel());
  locator.registerLazySingleton<ProfileModel>(() => ProfileModel());
  locator.registerLazySingleton<TrainingViewModel>(() => TrainingViewModel());
  locator.registerLazySingleton<TrainingModel>(() => TrainingModel());
  locator.registerLazySingleton<EvaluationModel>(() => EvaluationModel());
  locator
      .registerLazySingleton<EvaluationViewModel>(() => EvaluationViewModel());
  locator.registerLazySingleton<NotiViewModel>(() => NotiViewModel());
}
