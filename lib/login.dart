import 'package:flutter/material.dart';
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 5,),
            Column(
              children: [
                Image.asset(
                  'images/logo.png',
                  height: 100,
                  width: 100,
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 55,
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.key),
                      hintText: 'ຊື່ເຂົ້າໃຊ້ລະບົບ ຫຼື ອີເມວ',
                      hintStyle: const TextStyle(fontFamily: 'Noto Sans Lao'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 55,
                  child: TextFormField(
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      hintText: 'ລະຫັດຜ່ານ',
                      hintStyle: const TextStyle(fontFamily: 'Noto Sans Lao'),
                      suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      child: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 55,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                        // Perform login action
                    },
                    child: const Text('ເຂົ້າສູ່ລະບົບ',style: TextStyle(fontFamily: 'Noto Sans Lao'),),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide.none,
                        ),
                      )
                    )
                  ),
                ),
                const SizedBox(height: 70),
              ],
            ),
            const Text("Demo App By Tik v1.0", style: TextStyle(color: Colors.grey,fontStyle: FontStyle.italic),)
          ],
        ),
      ),
    );
  }
}