import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/pages/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Add any necessary initialization code here
    _delay();
  }

  void _delay() async {
    await Future.delayed(const Duration(seconds: 4));
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return Login();
    }), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Lottie.asset('images/lotties/coding.json'),
      ),
    );
  }
}
