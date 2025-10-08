import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gravito/screens/LoginScreen.dart';
import 'package:gravito/screens/NewPasswordScreen.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
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
                        Get.back();
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
              Text(
                "6 digit OTP has been sent to your registered mobile number",
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
              const SizedBox(height: 20),
              Text(
                "Enter OTP",
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
              const SizedBox(height: 10),
              Text("In 90 sec", textAlign: TextAlign.right),
              const SizedBox(height: 20),
              OtpTextField(
                numberOfFields: 6,
                showFieldAsBox: true,
                contentPadding: EdgeInsets.all(2),
                borderColor: Colors.black,
                autoFocus: true,
                onCodeChanged: (String code) {},
                onSubmit: (String verificationCode) {},
                fillColor: Colors.white,
                enabledBorderColor: Colors.black,
                keyboardType: TextInputType.number,
                focusedBorderColor: Colors.green,
              ),
              const SizedBox(height: 10),
              TextButton(onPressed: (){}, child: Text("Resend OTP", style: TextStyle(
                color:Colors.green,
                fontSize: 16
              ),)),
              const SizedBox(height: 40),
              ButtonWidget("Verify", () {
                Get.to(NewpasswordScreen());
              }),
            ],
          ),
        ),
      ),
    );
  }
}
