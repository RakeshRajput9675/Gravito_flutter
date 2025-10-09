import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gravito/screens/HomeScreen.dart';
import 'package:gravito/screens/OtpScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _passwordController = TextEditingController();
  bool _isObscure = true; // controls password visibility

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
          alignment: Alignment.topCenter,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image(
                image: AssetImage('asset/images/logo.png'),
                width: 160,
                height: 200,
                fit: BoxFit.none,
              ),
              const SizedBox(height: 20),

              // Mobile Number Field
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                height: 52,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    const Text(
                      "+91",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      height: 30,
                      width: 1,
                      color: Colors.grey.shade300,
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                    ),
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter Mobile Number",
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Password Field
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                height: 52,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _passwordController,
                        obscureText: _isObscure,
                        textAlign: TextAlign.left, // 👈 text starts from left
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter Password",
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                    // Visibility toggle icon
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                      icon: Icon(
                        _isObscure ? Icons.visibility : Icons.visibility_off,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => OtpScreen()),
                  );
                },
                child: Text(
                  "Reset Password",
                  style: TextStyle(color: Colors.green, fontSize: 12),
                ),
              ),
              const SizedBox(height: 20),
              ButtonWidget("Login", () {
                Get.to(Homescreen());
              }),
            ],
          ),
        ),
      ),
    );
  }
}
Container ButtonWidget(String text, VoidCallback onPressed) {
  return Container(
    height: 56,
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 1,
          blurRadius: 5,
          offset: const Offset(0, 3),
        ),
      ],
      color: Colors.green,
      borderRadius: BorderRadius.circular(10),
    ),
    child: TextButton(
      onPressed: onPressed,
      child: Text(text, style: TextStyle(color: Colors.white, fontSize: 16)),
    ),
  );
}