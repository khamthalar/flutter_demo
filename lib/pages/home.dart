import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Home extends StatelessWidget {
  final User user;
  final GoogleSignIn googleSignIn;

  const Home({Key? key, required this.user, required this.googleSignIn}) : super(key: key);

  Future<void> _handleSignOut() async {
    // sign out from Firebase Authentication
    await FirebaseAuth.instance.signOut();
    // sign out from Google Sign-In
    await googleSignIn.signOut();
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: Text('Welcome ${user.displayName ?? ''}'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (user.photoURL != null)
              CircleAvatar(
                radius: 50.0,
                backgroundImage: NetworkImage(user.photoURL!),
              ),
            SizedBox(height: 8.0),
            Text(
              'Name: ${user.displayName ?? ''}',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'Email: ${user.email}',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: _handleSignOut,
              child: Text('Sign Out'),
            ),
          ],
        ),
      ),
    );
  }
}