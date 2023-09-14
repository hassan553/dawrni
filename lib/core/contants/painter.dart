import 'package:flutter/material.dart';

class RotatedTrapezoidalContainer extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final double rotationAngle; // Rotation angle in degrees

  const RotatedTrapezoidalContainer({
    super.key,
    required this.width,
    required this.height,
    required this.color,
    required this.rotationAngle,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle:
          rotationAngle * (3.14159265359 / 180.0), // Convert degrees to radians
      child: TrapezoidalContainer(
        width: width,
        height: height,
        color: color,
      ),
    );
  }
}

class TrapezoidalContainer extends StatelessWidget {
  final double width;
  final double height;
  final Color color;

  TrapezoidalContainer({
    required this.width,
    required this.height,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(width, height),
      painter: TrapezoidalPainter(color),
    );
  }
}

class TrapezoidalPainter extends CustomPainter {
  final Color color;

  TrapezoidalPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;

    final path = Path()
      ..moveTo(0, size.height) // Bottom-left corner
      ..lineTo(size.width * 0.15, 0) // Top-left corner
      ..lineTo(size.width * 0.9, 0) // Top-right corner
      ..lineTo(size.width, size.height) // Bottom-right corner
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
