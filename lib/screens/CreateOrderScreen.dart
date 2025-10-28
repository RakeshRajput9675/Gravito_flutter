import 'package:dropdown_flutter/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:gravito/screens/LoginScreen.dart';

class CreateOrderScreen extends StatefulWidget {
  const CreateOrderScreen({super.key});

  @override
  State<CreateOrderScreen> createState() => _CreateOrderScreenState();
}

class _CreateOrderScreenState extends State<CreateOrderScreen> {
  final items = [
    "Select Table",
    "Table No-1",
    "Table No-2",
    "Table No-3",
    "Table No-4",
    "Table No-5",
    "Table No-6",
    "Table No-7",
    "Table No-8",
    "Table No-9",
    "Table No-10",
    "Table No-11",
    "Table No-12",
  ];
  late var selectedItem = items[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // 👈 keeps text left-aligned
          children: [
            const Center(
              // 👈 only this one centered
              child: Text(
                "Create Order",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 24),
            const Text("Table number", style: TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            DropdownFlutter(
              items: items,
              initialItem: selectedItem,
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    selectedItem = value;
                  });
                }
              },
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ButtonWidget("Submit", () {}),
            ),
          ],
        ),
      ),
    );
  }
}
