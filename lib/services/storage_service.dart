import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

import '../stores/user_store.dart';
import 'interfaces/calculation_service_interface.dart';
import 'interfaces/storage_service_interface.dart';
import 'service_locator.dart';

class StorageService extends IStorageService {
  final ICalculationService _calculationService =
      locator<ICalculationService>();

  Future<String> uploadImageToFirebase({@required File imageFile}) async {
    String basePath = basename(imageFile.path);
    String date =
        _calculationService.formatDate(date: DateTime.now()).toString();
    String fileName =
        '${UserStore.getValueFromStore('storedHn')}_${date}_$basePath';
    var firebaseStorageRef = FirebaseStorage.instance.ref('woundImg/$fileName');
    await firebaseStorageRef.putFile(imageFile);
    String imageUrl;
    await firebaseStorageRef.getDownloadURL().then((url) => imageUrl = url);
    return imageUrl;
  }
}
