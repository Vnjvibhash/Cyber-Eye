import 'package:flutter/material.dart';

class ProfileHeaderPainter extends CustomPainter {
  final ThemeData theme;
  ProfileHeaderPainter(this.theme);

  @override
  void paint(Canvas canvas, Size size) {
    // Paint for the main purple blob
    final purplePaint = Paint()
      ..color = theme.colorScheme.secondary.withOpacity(0.8)
      ..style = PaintingStyle.fill;

    final cyanPaint = Paint()
      ..color = const Color(0xFF09C6F9).withOpacity(0.8)
      ..style = PaintingStyle.fill;

    // Path for the purple blob
    var purplePath = Path();
    purplePath.moveTo(size.width * 0.5, 0);
    purplePath.quadraticBezierTo(
      size.width * 0.1,
      size.height * 0.2,
      size.width * 0.3,
      size.height * 0.6,
    );
    purplePath.quadraticBezierTo(
      size.width * 0.6,
      size.height * 0.95,
      size.width,
      size.height * 0.7,
    );
    purplePath.lineTo(size.width, 0);
    purplePath.close();

    // Path for the cyan blob
    var cyanPath = Path();
    cyanPath.moveTo(size.width, 0);
    cyanPath.quadraticBezierTo(
      size.width * 0.8,
      size.height * 0.25,
      size.width * 0.5,
      size.height * 0.2,
    );
    cyanPath.quadraticBezierTo(
      size.width * 0.2,
      size.height * 0.15,
      0,
      size.height * 0.4,
    );
    cyanPath.lineTo(0, 0);
    cyanPath.close();

    // Draw the shapes
    canvas.drawPath(cyanPath, cyanPaint);
    canvas.drawPath(purplePath, purplePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
