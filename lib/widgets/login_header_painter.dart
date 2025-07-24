// Custom Painter for the header background blobs
import 'package:flutter/material.dart';

class HeaderPainter extends CustomPainter {
  final ThemeData theme;
  HeaderPainter(this.theme);

  @override
  void paint(Canvas canvas, Size size) {
    final paint1 = Paint()
      ..color = theme.colorScheme.primary.withOpacity(0.9)
      ..style = PaintingStyle.fill;

    final paint2 = Paint()
      ..color = theme.colorScheme.secondary.withOpacity(0.6)
      ..style = PaintingStyle.fill;

    final paint3 = Paint()
      ..color = const Color(0xFF3AF9EF).withOpacity(0.7)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(
      Offset(size.width * 0.1, size.height * 0.25),
      size.height * 0.75,
      paint1,
    );
    canvas.drawCircle(
      Offset(size.width * 0.3, size.height * 0.1),
      size.height * 0.7,
      paint2,
    );
    canvas.drawCircle(
      Offset(size.width * 0.15, size.height * 0.3),
      size.height * 0.55,
      paint3,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
