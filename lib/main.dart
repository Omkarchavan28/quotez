import 'package:flutter/material.dart';
import 'package:quotez/pages/homePage.dart';
import 'package:quotez/pages/profile.dart';

// void main() => runApp(MaterialApp(home: ProfileTwoPage()));
void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        // initialRoute: '/',
        // routes: {
        //   '/': (context) => Home(),
        //   '/profilePage': (context) => Profile(),
        // },
        home: Home(),
      ),
    );
