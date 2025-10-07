import 'package:flutter/material.dart';
import 'package:gravito/screens/OtpScreen.dart';

class NewpasswordScreen extends StatefulWidget {
  const NewpasswordScreen({super.key});

  @override
  State<NewpasswordScreen> createState() => _NewpasswordScreenState();
}

class _NewpasswordScreenState extends State<NewpasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
              alignment: Alignment.topCenter,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                Stack(
                alignment: Alignment.center,
                children: [
                  // Centered title
                  const Text(
                    "OTP",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => OtpScreen(),
                          ),
                        );
                      },
                      icon: const Icon(Icons.arrow_back_ios_new_outlined),
                    ),
                  ),
                ],
              ),
              Image(
                image: AssetImage('asset/images/logo.png'),
                width: 160,
                height: 200,
                fit: BoxFit.none,
              ),
              const SizedBox(height: 20),
              ]
            )
        )
    ));
  }
}
