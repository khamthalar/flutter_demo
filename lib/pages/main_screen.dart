
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_demo/pages/login.dart';

class MainScreen extends StatelessWidget {
  final User user;
  final GoogleSignIn googleSignIn;

  const MainScreen({Key? key,required this.user, required this.googleSignIn}) : super(key: key);

  Future<void> _handleSignOut(BuildContext context) async {
    // sign out from Firebase Authentication
    await FirebaseAuth.instance.signOut();
    // sign out from Google Sign-In
    await googleSignIn.signOut();
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return Login();
    }), (r) {
      return false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          // padding: const EdgeInsets.only(top: 15,),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FloatingActionButton.small(
                      onPressed: ()=>_handleSignOut(context),
                      backgroundColor: Colors.white,
                      elevation: 0,
                      child: const Icon(
                        Icons.power_settings_new_sharp,
                        size: 35,
                        color: Colors.black,
                      ),
                      
                
                    ),
                      // icon: const FaIcon(FontAwesomeIcons.google,size: 24,color: Colors.white,),
                      // label: const Text(''),
                      // style: ButtonStyle(
                      //     backgroundColor:MaterialStateProperty.all(Colors.blueAccent),
                      //     shape: MaterialStateProperty.all(
                      //       RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.circular(10),
                      //         side: BorderSide.none,
                      //       ),
                      //     ))),
                ],
              ),
              CircleAvatar(
                radius: 35,
                backgroundImage: NetworkImage(user.photoURL!),
              ),
              Text(user.displayName ?? ''),
              Text('${user.email}'),
              Center(child: 
                SizedBox(
                  height: 400,
                  width: double.infinity,
                  child: Lottie.asset('images/lotties/hello.json')
                ),
              ),
            ],
          ),
        )
      ],
    ));
  }
}
