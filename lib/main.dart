import 'package:flutter/material.dart';
import 'package:quotez/pages/authenticate.dart';
import 'package:quotez/pages/homePage.dart';

// void main() => runApp(MaterialApp(home: ProfileTwoPage()));
void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/auth',
        routes: {
          '/': (context) => Home(),
          '/auth': (context) => Authenticate(),
        },
        // home: Authenticate(),
      ),
    );
