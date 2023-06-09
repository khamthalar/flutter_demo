import 'package:flutter/material.dart';
import 'package:flutter_demo/pages/info.dart';
import 'package:flutter_demo/components/pagebuilder.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Image.asset(
            'images/img01.jpg',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 10,
            right: 10,
            child: Container(
              width: 100,
              height: 50,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(28)),
                  color: Colors.amber),
              child: const Center(child: Text("10,000 ກີບ")),
            ),
          ),
          const Positioned(
            top: 10,
            left: 5,
            child: SizedBox(
                width: 200,
                child: Text(
                  "ທົດລອງ\r\nທົດລອງ2",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                )),
          ),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,OpenPage(const Info()));
                },
                child: const Text("Show Info Page")),
          )
        ],
      ),
    );
  }
}
