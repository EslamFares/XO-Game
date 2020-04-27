import 'package:flutter/material.dart';

import 'HomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'XO',
      theme:ThemeData.dark(),
//      ThemeData(primarySwatch: Colors.red,),
      home: HomePage(),
    );
  }
}
