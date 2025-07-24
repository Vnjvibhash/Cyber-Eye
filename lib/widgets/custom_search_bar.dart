// lib/widgets/custom_search_bar.dart
import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final void Function(String)? onChanged;

  const CustomSearchBar({
    super.key,
    required this.controller,
    this.hintText = 'Search',
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          // CHANGE: Rounding only the top-left and bottom-right corners.
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
            topRight: Radius.circular(8), // Slight rounding on other corners
            bottomLeft: Radius.circular(8),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: TextField(
          controller: controller,
          onChanged: onChanged,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(top: 14),
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey.shade400),
            prefixIcon: const Icon(Icons.search, color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
