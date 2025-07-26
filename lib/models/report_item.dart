import 'package:flutter/material.dart';

class ReportItem {
  final String name;
  final String date;
  final String percentage;
  final IconData icon;
  final Color iconBgColor;

  ReportItem({
    required this.name,
    required this.date,
    required this.percentage,
    required this.icon,
    required this.iconBgColor,
  });
}

// Mock data for the list
final List<ReportItem> reportItems = [
  ReportItem(
    name: 'bob327#4561',
    date: '15 March 2020, 8:45 PM',
    percentage: '89.5%',
    icon: Icons.shopping_bag_outlined,
    iconBgColor: Colors.orange.shade300,
  ),
  ReportItem(
    name: 'alice16#4512',
    date: '13 March 2020, 11:10 AM',
    percentage: '78.8%',
    icon: Icons.favorite_border,
    iconBgColor: Colors.pink.shade200,
  ),
  ReportItem(
    name: 'raj#1582',
    date: '9 March 2020, 1:22 PM',
    percentage: '56.7%',
    icon: Icons.fitness_center_outlined,
    iconBgColor: Colors.cyan.shade200,
  ),
  ReportItem(
    name: 'shivam#9603',
    date: '7 March 2020, 7:45 PM',
    percentage: '89.0%',
    icon: Icons.shopping_bag_outlined,
    iconBgColor: Colors.orange.shade300,
  ),
  ReportItem(
    name: 'shiv#0891',
    date: '15 March 2020, 8:45 PM',
    percentage: '94.23%',
    icon: Icons.airplanemode_active_outlined,
    iconBgColor: Colors.red.shade300,
  ),
  ReportItem(
    name: 'vivek#1022',
    date: '28 February 2020, 11:10 AM',
    percentage: '64.4%',
    icon: Icons.favorite_border,
    iconBgColor: Colors.pink.shade200,
  ),
];
