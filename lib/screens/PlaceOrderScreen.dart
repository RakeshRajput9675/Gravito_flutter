import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:gravito/screens/HomeScreen.dart';
import 'package:gravito/screens/LoginScreen.dart';
import 'package:gravito/screens/ManualOrderScreen.dart';

class PlaceOrderScreen extends StatefulWidget {
  const PlaceOrderScreen({super.key});

  @override
  State<PlaceOrderScreen> createState() => _PlaceOrderScreenState();
}

class _PlaceOrderScreenState extends State<PlaceOrderScreen> {
  // One counter per item
  List<int> counters = [0, 0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            child: Column(
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back_ios_new_outlined),
                    ),
                    const Expanded(
                      child: Text(
                        "Place Order",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // Items
                ListView.builder(
                  itemCount: counters.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 1,
                      color: Colors.white,
                      margin: const EdgeInsets.only(bottom: 15),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                "asset/images/img.png",
                                height: 50,
                                width: 50,
                              ),
                            ),
                            const SizedBox(width: 10),

                            // Right side
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Expanded(
                                        child: Text(
                                          "Burger",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.black,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      const Text(
                                        "AED 500",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      // Drop-down text (mock)
                                      TextButton(
                                        onPressed: () {},
                                        style: ButtonStyle(
                                          overlayColor:
                                          MaterialStateProperty.all(
                                              Colors.transparent),
                                          backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.transparent),
                                        ),
                                        child: const Text(
                                          "Cheese ▼",
                                          style:
                                          TextStyle(color: Colors.black),
                                        ),
                                      ),

                                      // Counter buttons
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: const Color(0xff33040404)),
                                          borderRadius:
                                          BorderRadius.circular(10),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5, vertical: 2),
                                        child: Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  if (counters[index] > 0) {
                                                    counters[index]--;
                                                  }
                                                });
                                              },
                                              child: Image.asset(
                                                "asset/images/minus.png",
                                                height: 12,
                                                width: 14,
                                              ),
                                            ),
                                            const SizedBox(width: 5),
                                            Text(counters[index].toString()),
                                            const SizedBox(width: 5),
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  counters[index]++;
                                                });
                                              },
                                              child: Image.asset(
                                                "asset/images/plus.png",
                                                height: 12,
                                                width: 14,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(
                  width: double.infinity,
                  child: ButtonWidget("Add Items", () {
                    Get.to(const ManualOrderScreen());
                  }),
                ),
                const SizedBox(height: 10),
                Text("Special Request (Optional)", style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),),
                const SizedBox(height: 5,),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Color(0xff33040404),
                    ),
                  ),
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
                      fillColor: Colors.transparent,
                      border: InputBorder.none,
                      hint: Text(
                        "Write Your Special Request Here", style: TextStyle(
                        fontSize: 10,
                        color: Color(0xff666666),
                      ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: Card(
                    elevation: 0,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Bill Details",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                          ListView.builder(
                            itemCount: 6,
                            padding: EdgeInsets.zero,
                            // <-- THIS removes the sneaky gap
                            shrinkWrap: true,
                            // <-- tells it to take only needed height
                            physics: NeverScrollableScrollPhysics(),
                            // <-- disables internal scroll
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(vertical: 4),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,
                                  children: const [
                                    Text("data"),
                                    Text("data"),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                SizedBox(
                  width: double.infinity,
                  child: ButtonWidget("Place Order", () {
                   showCustomSnackBar(context,message: 'Order Placed Successfully');
                   Get.to(HomeScreen());
                  }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void showSuccessDialog(
    BuildContext context, {
      required String message,
      String imagePath = "asset/images/dialog.png",
      Duration autoCloseDuration = const Duration(seconds: 2),
      Widget? nextScreen, // <-- pass any screen you want to go to
    }) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext dialogContext) {
      Future.delayed(autoCloseDuration, () {
        if (Navigator.canPop(dialogContext)) {
          Navigator.pop(dialogContext);

          if (nextScreen != null) {
            Get.to(nextScreen); // <-- navigate to your chosen screen
          }
        }
      });

      return AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(imagePath, height: 85, width: 85, fit: BoxFit.fill),
            const SizedBox(height: 16),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      );
    },
  );
}

void showCustomSnackBar(
    BuildContext context, {
      required String message,
      Color backgroundColor = Colors.green,
      Duration duration = const Duration(seconds: 2),
    }) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      elevation: 1,
      duration: duration,
      backgroundColor: backgroundColor,
      behavior: SnackBarBehavior.floating,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
    ),
  );
}

