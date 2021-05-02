import 'package:flutter/material.dart';
import '../models/notification_list_model.dart';
import '../services/service_locator.dart';
import '../view_models/notification_view_model.dart';
import '../widget/notification_card.dart';
import '../widget/shared/loading_widget.dart';

class NotificationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final NotiViewModel _notiViewModel = locator<NotiViewModel>();

  Future<List<NotiData>> _notidata;
  List<NotiData> notidata = [];

  @override
  void initState() {
    setState(() {
      _notidata = _notiViewModel.getUsers();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('การแจ้งเตือน'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          tooltip: 'กลับ',
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: notificationDataBody(),
    );
  }

  FutureBuilder notificationDataBody() {
    return FutureBuilder<List<NotiData>>(
        future: _notidata,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return loadingProgress;
          } else {
            notidata.clear();
            notidata.addAll(snapshot.data);

            return NotificationCard(
              notiData: notidata,
            );
          }
        });
  }
}
