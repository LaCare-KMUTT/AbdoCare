import 'dart:io';

import 'package:flutter/material.dart';

// ignore: one_member_abstracts
abstract class IStorageService {
  Future<String> uploadImageToFirebase({@required File imageFile});
}
