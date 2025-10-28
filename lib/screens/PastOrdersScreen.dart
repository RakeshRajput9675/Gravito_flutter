import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PastOrdersScreen extends StatefulWidget {
  const PastOrdersScreen({super.key});

  @override
  State<PastOrdersScreen> createState() => _PastOrdersScreenState();
}

class _PastOrdersScreenState extends State<PastOrdersScreen> {
  List<OrderDetails> orderList = [
    OrderDetails(
      orderId: 7761,
      dateTime: DateTime.parse("2025-06-18T13:00:00"),
      numberOfItems: 2,
      tableNumber: 576,
      status: "Completed",
    ),
    OrderDetails(
      orderId: 7762,
      dateTime: DateTime.parse("2025-06-19T14:30:00"),
      numberOfItems: 3,
      tableNumber: 102,
      status: "Pending",
    ),
    OrderDetails(
      orderId: 7763,
      dateTime: DateTime.parse("2025-06-20T12:45:00"),
      numberOfItems: 1,
      tableNumber: 210,
      status: "Cancelled",
    ),
  ];

  final TextEditingController _searchController = TextEditingController();
  DateTime? fromDate;
  DateTime? toDate;

  // Generic date picker
  Future<DateTime?> _selectDate(
    BuildContext context, {
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
  }) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: firstDate ?? DateTime(2000),
      lastDate: lastDate ?? DateTime.now(),
    );
    return picked;
  }

  String formatDate(DateTime? date) {
    if (date == null) return "Select Date";
    return DateFormat('dd MMM yyyy').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Column(
            children: [
              Text(
                "Order History",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
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
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () async {
                        final picked = await _selectDate(
                          context,
                          initialDate: fromDate ?? DateTime.now(),
                          lastDate: toDate ?? DateTime.now(),
                        );
                        if (picked != null) {
                          setState(() {
                            fromDate = picked;
                            // If fromDate > toDate, reset toDate
                            if (toDate != null && fromDate!.isAfter(toDate!)) {
                              toDate = null;
                            }
                          });
                        }
                      },
                      child: Container(
                        height: 48,
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 12,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: .5,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              fromDate == null
                                  ? "From"
                                  : DateFormat('dd MMM yyyy').format(fromDate!),
                            ),
                            Icon(Icons.calendar_month),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () async {
                        if (fromDate == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Please select 'From' date first."),
                            ),
                          );
                          return;
                        }

                        final picked = await _selectDate(
                          context,
                          initialDate:
                              toDate ?? fromDate!.add(const Duration(days: 1)),
                          // next day by default
                          firstDate: fromDate!,
                          // 👈 toDate must be after fromDate
                          lastDate: DateTime.now(), // 👈 can't go beyond today
                        );

                        if (picked != null) {
                          setState(() {
                            toDate = picked;
                          });
                        }
                      },
                      child: Container(
                        height: 48,
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 12,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: .5,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              toDate == null
                                  ? "To"
                                  : DateFormat('dd MMM yyyy').format(toDate!),
                            ),
                            Icon(Icons.calendar_month),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ListView.builder(
                itemBuilder: (context, index) {
                  final order = orderList[index]; // 👈 get single item
                  return pastOrderItem(order);
                },
                itemCount: orderList.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget pastOrderItem(OrderDetails order) {
  return Card(
    color: Colors.white,
    elevation: 2,
    shadowColor: Colors.grey.withOpacity(0.2),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),

    child: Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        children: [
          Row(
            children: [
              Text("Order Id", style: TextStyle(
                color: Color(0xff666666)
              ),),
              Spacer(),
              Text(order.orderId.toString()),
            ],
          ),
          const SizedBox(height: 12,),

          Row(
            children: [
              Text("Date & Time",style: TextStyle(
                  color: Color(0xff666666)
              ),),
              Spacer(),
              Text(order.formattedDate.toString()),
            ],
          ),
          const SizedBox(height: 12,),

          Row(
            children: [
              Text("Number of Item",style: TextStyle(
                  color: Color(0xff666666)
              ),),
              Spacer(),
              Text(order.numberOfItems.toString()),
            ],
          ),
          const SizedBox(height: 12,),
          Row(
            children: [
              Text("Table Number",style: TextStyle(
                  color: Color(0xff666666)
              ),),
              Spacer(),
              Text(order.tableNumber.toString()),
            ],
          ),
          const SizedBox(height: 12,),
          Row(
            children: [
              Text("Status",style: TextStyle(
                  color: Color(0xff666666)
              ),),
              Spacer(),
              Text(order.status.toString()),
            ],
          ),
        ],
      ),
    ),
  );
}

class OrderDetails {
  final int orderId;
  final DateTime dateTime;
  final int numberOfItems;
  final int tableNumber;
  final String status;

  OrderDetails({
    required this.orderId,
    required this.dateTime,
    required this.numberOfItems,
    required this.tableNumber,
    required this.status,
  });

  factory OrderDetails.fromJson(Map<String, dynamic> json) {
    return OrderDetails(
      orderId: json['orderId'] ?? 0,
      dateTime: DateTime.parse(json['dateTime']),
      numberOfItems: json['numberOfItems'] ?? 0,
      tableNumber: json['tableNumber'] ?? 0,
      status: json['status'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'orderId': orderId,
      'dateTime': dateTime.toIso8601String(),
      'numberOfItems': numberOfItems,
      'tableNumber': tableNumber,
      'status': status,
    };
  }

  /// Optional: easy-to-read date format
  String get formattedDate {
    return "${dateTime.day.toString().padLeft(2, '0')}/"
        "${dateTime.month.toString().padLeft(2, '0')}/"
        "${dateTime.year.toString().substring(2)} at "
        "${_formatTime(dateTime)}";
  }

  String _formatTime(DateTime date) {
    int hour = date.hour > 12 ? date.hour - 12 : date.hour;
    String period = date.hour >= 12 ? "pm" : "am";
    return "${hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')} $period";
  }
}
