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
  var list = [
    HomeScreen(),
    PastOrdersScreen(),
    CreateOrderScreen(),
    ProfileScreen()

  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:list[currentIndex],
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            icon:Icon(Icons.notifications_sharp),
            label: 'Past Orders',
          ),
          NavigationDestination(
            icon: Icon(Icons.messenger_sharp),
            label: 'Create Order',
          ),
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
