import 'package:flutter/material.dart';

class Transfertablescreen extends StatefulWidget {
  const Transfertablescreen({super.key});

  @override
  State<Transfertablescreen> createState() => _TransfertablescreenState();
}

class _TransfertablescreenState extends State<Transfertablescreen> {
  final TextEditingController _searchController = TextEditingController();
  int? selectedValue;
  void showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
        builder: (BuildContext context) {
          // Auto close after 2 seconds
          Future.delayed(const Duration(seconds: 2), () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
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
              Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.asset("asset/images/dialog.png", height: 85, width: 85, fit: BoxFit.fill,),
              ),
              const SizedBox(height: 16),
              const Text(
                "Table Assigned Successfully!",
                textAlign: TextAlign.center,
                style: TextStyle(
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


  Widget TableItem(int value, String tableNumber) {
    return GestureDetector(
      onTap: (){
        showSuccessDialog(context);
       },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Color(0xffCDCDCD), width: 1),
        ),
        child: Row(
          children: [
            Radio<int>(
              activeColor: Colors.green,
              value: value,
              groupValue: selectedValue,
              onChanged: (val) {
                setState(() {
                  selectedValue = val!;
                });
              },
            ),
            Text(
              "Table Number: $tableNumber",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }


  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 30,
              bottom: 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.arrow_back_ios_new_rounded),
                    const Expanded(
                      child: Text(
                        "Transfer Table",
                        textAlign: TextAlign.center,
                        style: TextStyle(
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
                      const Icon(Icons.search, color: Colors.black),
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

                // ✅ Now aligned left
                const Text(
                  "Transfer table Number : 567",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 20),
                Card(
                  elevation: 2,
                  color: Colors.white,
                  shadowColor: Colors.grey.withOpacity(0.2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(padding: EdgeInsets.all(14),
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      return TableItem(index, (index + 641).toString());
                    },
                    itemCount: 20,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                  ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

