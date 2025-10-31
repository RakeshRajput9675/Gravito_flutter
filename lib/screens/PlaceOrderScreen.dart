import 'package:flutter/material.dart';

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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
