import 'package:flutter/material.dart';
import 'package:flutter_demo/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Noto Sans Lao',
        // useMaterial3: true,
        // colorSchemeSeed: Colors.grey,
        primarySwatch: Colors.blueGrey,
      ),
      home: Login(),
    );
  }
}