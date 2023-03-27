import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_demo/pages/login.dart';
import 'package:flutter_demo/pages/home.dart';
// import 'package:flutter_demo/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
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
      home: 
      // SplashScreen(),
      StreamBuilder(
        stream: _auth.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          if (snapshot.hasData) {
            return Home(user: snapshot.data!, googleSignIn: _googleSignIn);
          } else {
            return const Login();
          }
        },
      ),
    );
  }
}
