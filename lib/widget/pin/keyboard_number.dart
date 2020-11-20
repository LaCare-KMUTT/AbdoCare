import 'package:flutter/material.dart';

class KeyboardNumber extends StatelessWidget {
  final int n;
  final Function() onPressed;
  KeyboardNumber({this.n, this.onPressed});
  @override
  Widget build(BuildContext context) => Container(
        width: 60.0,
        height: 60.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFFC37447).withOpacity(0.1),
        ),
        alignment: Alignment.center,
        child: MaterialButton(
          padding: EdgeInsets.all(8.0),
          onPressed: onPressed,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(60.0),
          ),
          height: 90.0,
          child: Text(
            "$n",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24 * MediaQuery.of(context).textScaleFactor,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
}
