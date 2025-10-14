import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int? selectedIndex;
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
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
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
            crossAxisAlignment: CrossAxisAlignment.start,
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
                          // ✅ Add to selected list only if not already selected
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
                      child: TextButton(onPressed: () {}, child: Text(
                          "Manual Order", style: TextStyle(
                        color: Colors.red,
                      ),)),
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
                            foregroundColor: Colors.white,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
