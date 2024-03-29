import 'package:flutter/material.dart';
import 'package:multi_store/pages/cart_page.dart';
import 'package:multi_store/pages/stores_page.dart';

import '../bodies/category_body.dart';
import '../bodies/home_body.dart';
import 'profile_page.dart';

class CustomerHomePage extends StatefulWidget {
  static const String routeName = 'customer-home-page';
  const CustomerHomePage({super.key});

  @override
  State<CustomerHomePage> createState() => _CustomerHomePageState();
}

class _CustomerHomePageState extends State<CustomerHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _bodies = [
    const HomeBody(),
    const CategoryBody(),
    const StoresPage(),
    const CartPage(),
    const ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodies[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w600,
        ),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Category'),
          BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'Stores'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
