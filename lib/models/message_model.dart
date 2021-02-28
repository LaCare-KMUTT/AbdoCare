import 'package:flutter/cupertino.dart';

class MessageModel extends ChangeNotifier {
  final List<dynamic> messages = <dynamic>[];

  MessageModel();

  void insertMessage(int index, dynamic insertElem) {
    messages.insert(index, insertElem);
  }
}
