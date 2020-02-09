import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';

import 'check_internet.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Study Jam',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter Study Jam"),
          //elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
        ),
        body: CheckInternetScreen(),
      ),
    );
  }
}