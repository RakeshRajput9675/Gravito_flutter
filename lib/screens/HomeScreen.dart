import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'LoginScreen.dart';
import 'ManualOrderScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int? selectedIndex;
  final TextEditingController _specialRequestController = TextEditingController();

  Set<int> selectedIndexes = {};
  var list = [
    "Table No-101",
    "Table No-101",
    "Table No-101",
    "Table No-101",
    "Table No-101",
    "Table No-101",
    "Table No-101",
    "Table No-101",
    "Table No-101",
    "Table No-101",
    "Table No-101",
    "Table No-101"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ✅ This covers the entire screen (including empty areas)
      backgroundColor: const Color(0xfff5f5f5),

      appBar: AppBar(
        backgroundColor: Color(0xfff5f5f5),
        elevation: 0,
        actionsPadding: const EdgeInsets.only(right: 10),
        title: const Text(
          "Home",
          style: TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: const [
          Icon(Icons.notifications_active_outlined,
              size: 30, color: Colors.black87),
        ],
      ),

      drawer: const Drawer(),

      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color(0xfff5f5f5),

        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16), // add padding for spacing
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.green.shade400,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Total Tips Earned",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          SizedBox(width: 8),
                          Text(
                            "\$1000000",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),

                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade400,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Total Orders Served",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          SizedBox(width: 8),
                          Text(
                            "50",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              Text("Today's assigned tables",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
              const SizedBox(height: 30),

              SizedBox(
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    bool isSelected = selectedIndexes.contains(index);
                    return InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        setState(() {
                          if (isSelected) {
                            selectedIndexes.remove(index);
                          } else {
                            selectedIndexes.add(index);
                          }
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? Colors.blueAccent // selected color
                              : const Color(0xffe6e9f3), // default color
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            list[index],
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: isSelected ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Expanded(child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: BoxBorder.all(color: Colors.red)
                    ),
                    child: Center(
                      child: TextButton(onPressed: () {
                        Get.to(ManualOrderScreen());
                      },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          overlayColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                        ), child: Text(
                          "Manual Order", style: TextStyle(
                            color: Colors.red
                        ),),
                      ),
                    ),
                  )),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.red,
                            overlayColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                          ),
                          child: const Text(
                            "Transfer Table",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )

                ],
              ),
              const SizedBox(height: 30),
              Text("Pending Items", style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold
              ),),
              ListView.builder(
                itemCount: 2,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return itemWidget();
                },
              ),

              const SizedBox(height: 30),
              Text("Special Requests", style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold
              )),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10, horizontal: 10),
                  child: TextField(
                    controller: _specialRequestController,
                    textAlign: TextAlign.left,
                    maxLines: null,
                    decoration: const InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      // ✅ removes extra space inside
                      border: InputBorder.none,
                      hintText: "Enter your special request",
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Text("Served Items", style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold
              )),
              const SizedBox(height: 10),
              ListView.builder(itemBuilder: (context, index) {
                return itemWidgetWithoutButton();
              },
                itemCount: 2,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
              ),
              const SizedBox(height: 30),
              Text("Cancel Items", style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold
              )),
              const SizedBox(height: 10),
              ListView.builder(itemBuilder: (context, index) {
                return itemWidgetWithoutButton();
              },
                itemCount: 2,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
              ),
              const SizedBox(height: 30),
              ButtonWidget("View Bill Details", () {}),
              const SizedBox(height: 30),
              Center(
                child: Text("Cancel Order", style: TextStyle(
                    color: Colors.red
                ),),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget itemWidgetWithoutButton() {
  return Card(
    shadowColor: Colors.black12,
    color: Colors.white,
    elevation: 2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'asset/images/img.png',
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Vegetables Noodle's",
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      "Lorem ipsum dolor sit amet, consectetur adipi.",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                      ),
                    ),
                    Row(
                      spacing: 0,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "2 × AED 100",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.green,
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            minimumSize: Size.zero,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Text("2 Add-Ons"),
                              SizedBox(width: 6),
                              Icon(Icons.add_circle_outline, size: 18),
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
        ],
      ),
    ),
  );
}

Widget itemWidget() {
  return Card(
    shadowColor: Colors.black12,
    color: Colors.white,
    elevation: 2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'asset/images/img.png',
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Vegetables Noodle's",
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      "Lorem ipsum dolor sit amet, consectetur adipi.",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "2 × AED 100",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.green,
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            minimumSize: Size.zero,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Text("2 Add-Ons"),
                              SizedBox(width: 6),
                              Icon(Icons.add_circle_outline, size: 18),
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
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(child: Container(
                height: 36,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: BoxBorder.all(color: Colors.green)
                ),
                child: Center(
                  child: TextButton(onPressed: () {},
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      overlayColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                    ), child: Text(
                      "Cancel Item", style: TextStyle(
                        color: Colors.green
                    ),),
                  ),
                ),
              )),
              const SizedBox(width: 10),
              Expanded(
                child: Container(
                  height: 36,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.green,
                        overlayColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                      ),
                      child: const Text(
                        "Served",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    ),
  );
}
