import 'package:flutter/material.dart';
import '../services/interfaces/firebase_service_interface.dart';
import '../services/service_locator.dart';

class NotiIcon extends StatefulWidget {
  final IconData iconData;
  final VoidCallback onTap;
  final int notificationCount;
  const NotiIcon({
    Key key,
    this.onTap,
    @required this.iconData,
    this.notificationCount,
  }) : super(key: key);

  @override
  _NotiIconState createState() => _NotiIconState();
}

class _NotiIconState extends State<NotiIcon> {
  final IFirebaseService _firebaseService = locator<IFirebaseService>();
  var _notiCounter;
  // ignore: type_annotate_public_apis
  var notiCounter;
  @override
  void initState() {
    super.initState();
    initData();
  }

  void initData() async {
    notiCounter = await _firebaseService.getNoticounter();

    setState(() {
      _notiCounter = notiCounter;
    });
  }

  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        width: 72,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Icon(
              widget.iconData,
              size: 30,
            ),
            Positioned(
                top: 0,
                right: 7,
                child: (() {
                  if (_notiCounter == null || _notiCounter == 0) {
                    return SizedBox();
                  } else {
                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.red),
                      alignment: Alignment.center,
                      child: Text(_notiCounter.toString()),
                    );
                  }
                }()))
          ],
        ),
      ),
    );
  }
}
