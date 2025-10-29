import 'package:flutter/material.dart';
import 'package:gravito/screens/LoginScreen.dart';

class ManualOrderScreen extends StatefulWidget {
  const ManualOrderScreen({super.key});

  @override
  State<ManualOrderScreen> createState() => _ManualOrderScreenState();
}

class _ManualOrderScreenState extends State<ManualOrderScreen> {
  final TextEditingController _searchController = TextEditingController();
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.arrow_back_ios_new_rounded),
                    Expanded(
                      child: Text(
                        "Table No-",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 24),
                  ],
                ),
                const SizedBox(height: 20),
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
                    children: [
                      Icon(Icons.search, color: Colors.black),
                      const SizedBox(width: 5),
                      Expanded(
                        child: TextField(
                          controller: _searchController,
                          textAlign: TextAlign.left,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search",
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      bool isSelected = selectedIndex == index;
                      return Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Column(
                            children: [
                              Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 6,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                  border: Border.all(
                                    color: isSelected
                                        ? Colors.green
                                        : Colors
                                              .transparent, // highlight border
                                    width: 2,
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    "asset/images/img.png",
                                    height: 30,
                                    width: 30,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text("data"),

                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: 10,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: SizedBox(
                        width: double.infinity,
                        child: Card(
                          color: Colors.white,
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        "asset/images/img.png",
                                        height: 65,
                                        width: 65,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "One-Pot Lemongrass Chicken",
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            "Lorem ipsum dolor sit amet consectetur adipi. ",
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    "4.3",
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 5),

                                                  Icon(
                                                    Icons.star,
                                                    color: Colors.yellow,
                                                    size: 12,
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                height: 16,
                                                width: 1,
                                                color: Colors.grey.withOpacity(
                                                  0.4,
                                                ),
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                      horizontal: 8,
                                                    ),
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.local_offer_outlined,
                                                    color: Colors.green,
                                                    size: 12,
                                                  ),
                                                  const SizedBox(width: 5),

                                                  Text(
                                                    "60% Off Use try New",
                                                    style: TextStyle(fontSize: 8),
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                height: 16,
                                                width: 1,
                                                color: Colors.grey.withOpacity(
                                                  0.4,
                                                ),
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                      horizontal: 8,
                                                    ),
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.access_time,
                                                    color: Colors.grey,
                                                    size: 12,
                                                  ),
                                                  const SizedBox(width: 5),
                                                  Text(
                                                    "30-40 min",
                                                    style: TextStyle(fontSize: 8),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 15),
                                Row(
                                  children: [
                                    Text(
                                      "AED 500",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    const SizedBox(width: 20),
                                    Expanded(
                                      child: ButtonWidget("Add", () {
                                        showModalBottomSheet(
                                          context: context,
                                          isScrollControlled: true,
                                          backgroundColor: Colors.white,
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20),
                                            ),
                                          ),
                                          builder: (BuildContext context) {
                                            return SizedBox(
                                              height: 300,
                                              width: double.infinity,
                                              child: Padding(
                                                padding: const EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 25),
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: const [
                                                    SizedBox(height: 16),
                                                   Row(
                                                     children: [
                                                      Expanded(child:  Text(
                                                        "Item name",
                                                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                                      ),),
                                                       Icon(Icons.ac_unit_outlined)
                                                     ],
                                                   ),
                                                    SizedBox(height: 12),
                                                    Divider(height: 1, color: Colors.grey),
                                                    SizedBox(height: 15,),
                                                    Text("Add On", textAlign: TextAlign.start, style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w700,
                                                    ),),
                                                    SizedBox(height: 15,),
                                                    Card(
                                                      child: Padding(padding: EdgeInsets.all(10),
                                                        child: Card(
                                                          child: ListTile(

                                                          ),

                                                        ),
                                                     ),
                                                    )

                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      }),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );

                  },
                  itemCount: 10,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
