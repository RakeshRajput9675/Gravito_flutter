import 'package:flutter/material.dart';
import 'package:gravito/screens/PastOrdersScreen.dart';
import 'package:gravito/screens/ProfileScreen.dart';
import 'CreateOrderScreen.dart';
import 'HomeScreen.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  int currentIndex = 0;

  final List<Widget> pages = [
    HomeScreen(),
    PastOrdersScreen(),
    CreateOrderScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex, // ✅ important for highlight
        onDestinationSelected: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        indicatorColor: Colors.green.shade100, // ✅ highlight color
        destinations: const [
          NavigationDestination(
            selectedIcon: Icon(Icons.home, color: Colors.green),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.receipt_long, color: Colors.green),
            icon: Icon(Icons.receipt_outlined),
            label: 'Past Orders',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.add_circle, color: Colors.green),
            icon: Icon(Icons.add_circle_outline),
            label: 'Create Order',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.person, color: Colors.green),
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
