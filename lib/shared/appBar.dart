import 'package:flutter/material.dart';

AppBar buildAppBar() {
  return AppBar(
    elevation: 0.0,
    title: Text(
      'Quotez',
      textAlign: TextAlign.start,
      style: TextStyle(
        color: Color(0xFF34495E),
        fontSize: 40.0,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w700,
      ),
    ),
    backgroundColor: Colors.white,
  );
}
