import 'package:flutter/material.dart';
import 'package:cybereye/screens/home_screen.dart';
import 'package:cybereye/screens/reports_screen.dart';
import 'package:cybereye/screens/profile_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _screens = <Widget>[
    HomeScreen(),
    ReportsScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

    Color _iconColor(int index) {
    return _selectedIndex == index ? Colors.white : Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: const Color(0xFF3A3A3A).withAlpha(20),
        color: theme.colorScheme.primary,
        buttonBackgroundColor: theme.colorScheme.secondary,
        height: 60,
        items: <Widget>[
          Icon(Icons.home, size: 30, color: _iconColor(0)),
          Icon(Icons.edit_document, size: 30, color: _iconColor(1)),
          Icon(Icons.person, size: 30, color: _iconColor(2)),
        ],
        animationDuration: const Duration(milliseconds: 300),
        animationCurve: Curves.easeInOut,
        onTap: _onItemTapped,
        index: _selectedIndex,
      ),
    );
  }
}
