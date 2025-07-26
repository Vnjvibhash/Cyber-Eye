import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:cybereye/screens/home_screen.dart';
import 'package:cybereye/screens/reports_screen.dart';
import 'package:cybereye/screens/profile_screen.dart';
import 'package:cybereye/widgets/custom_drawer.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  late final List<Widget> _screens = [
    HomeScreen(scaffoldKey: _scaffoldKey),
    ReportsScreen(scaffoldKey: _scaffoldKey),
    ProfileScreen(scaffoldKey: _scaffoldKey),
  ];

  // --- NEW METHOD TO HANDLE NAVIGATION ---
  void _handleNavigation(int index) {
    // If the drawer is open, close it first
    if (_scaffoldKey.currentState?.isDrawerOpen ?? false) {
      Navigator.pop(context);
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer(
        selectedIndex: _selectedIndex,
        onItemTapped: _handleNavigation,
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        color: theme.colorScheme.primary,
        buttonBackgroundColor: theme.colorScheme.secondary,
        height: 60,
        items: const <Widget>[
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.edit_document, size: 30, color: Colors.white),
          Icon(Icons.person, size: 30, color: Colors.white),
        ],
        animationDuration: const Duration(milliseconds: 300),
        animationCurve: Curves.easeInOut,
        onTap: _handleNavigation, // Also use the new handler here
        index: _selectedIndex,
      ),
    );
  }
}
