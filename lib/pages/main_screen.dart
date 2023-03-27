import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainScreen extends StatelessWidget {
  final User user;
  const MainScreen({Key? key,required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          // padding: const EdgeInsets.only(top: 15,),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FloatingActionButton.small(
                      onPressed: ()=>{},
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
              Text('${user.displayName ?? ''}'),
              Text('${user.email}')
            ],
          ),
        )
      ],
    ));
  }
}
