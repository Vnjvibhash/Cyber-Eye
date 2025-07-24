import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String label;
  final String value;
  final bool showCheckIcon;
  final Color checkIconColor;
  final Color dividerColor;

  const CustomInputField({
    super.key,
    required this.label,
    required this.value,
    this.showCheckIcon = true,
    this.checkIconColor = const Color(
      0xFF43D4C4,
    ), 
    this.dividerColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              if (showCheckIcon) 
                Icon(Icons.check, color: checkIconColor, size: 20),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 10),
          Divider(
            color: dividerColor.withOpacity(0.5),
          ),
        ],
      ),
    );
  }
}
