import 'package:cybereye/widgets/custom_button.dart';
import 'package:cybereye/widgets/drawer_profile_header.dart';
import 'package:flutter/material.dart';
import 'package:cybereye/screens/login_screen.dart';
import 'package:cybereye/widgets/drawer_menu_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomDrawer extends StatelessWidget {
  final int selectedIndex;
  final void Function(int) onItemTapped;

  const CustomDrawer({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  void _signOut(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('is_logged_in_cyber_eye', false);

    if (context.mounted) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const LoginScreen()),
        (Route<dynamic> route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Drawer(
      backgroundColor: theme.scaffoldBackgroundColor,
      elevation: 0,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DrawerProfileHeader(
                imageUrl:
                    'https://res.cloudinary.com/datxdx0wi/image/upload/v1750217121/pjlbiwax6pwd1obiiwpt.jpg',
                name: 'Viveka Jee',
                username: 'vivek#1022',
                onTap: () {
                  onItemTapped(2);
                },
              ),
              const SizedBox(height: 30),
              DrawerMenuItem(
                icon: Icons.home_outlined,
                text: 'Home',
                isSelected: selectedIndex == 0,
                onTap: () => onItemTapped(0),
              ),
              const SizedBox(height: 10),
              DrawerMenuItem(
                icon: Icons.edit_document,
                text: 'Reports',
                isSelected: selectedIndex == 1,
                onTap: () => onItemTapped(1),
              ),
              const SizedBox(height: 10),
              DrawerMenuItem(
                icon: Icons.person_outline,
                text: 'Profile',
                isSelected: selectedIndex == 2,
                onTap: () => onItemTapped(2),
              ),
              const Spacer(),
              CustomGradientButton(
                      text: 'Sign out',
                      onPressed: () => _signOut(context),
                      icon: Icons.logout,
                    ),
            ],
          ),
        ),
      ),
    );
  }

}
