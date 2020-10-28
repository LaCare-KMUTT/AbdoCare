import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFC37447),
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              Icons.keyboard,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () {
              print('แป้นพิมพ์');
              Navigator.pushNamed(context, '/');
            },
          ),
          IconButton(
            icon: Icon(
              Icons.home,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () {
              print('เมนู');
            },
          ),
        ],
      ),
    );
  }
}
