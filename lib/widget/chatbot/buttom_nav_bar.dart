import 'package:flutter/material.dart';
import '../rich_menu.dart';

class ButtomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        color: Theme.of(context).primaryColor,
        height: 50,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7.0)),
                  onPrimary: Colors.white,
                  primary: Color(0xFFC37447)),
              child: Container(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.home,
                      color: Colors.white,
                      size: 30.0,
                    ),
                    Text(
                      'เมนูหลัก',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ],
                ),
              ),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) => SingleChildScrollView(
                          child: Container(
                            padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom),
                            child: RichMenu(),
                          ),
                        ));
              },
            ),
          ],
        ),
      );
}
