import 'package:flutter/material.dart';

class Paints extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Color.fromARGB(255, 243, 33, 194)
      ..strokeWidth = 6
      ..style = PaintingStyle.stroke;
    var c = Offset(size.width / 1.25, size.height / 1.4);
    canvas.drawCircle(c, 34, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class SmallPaints extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Color.fromARGB(255, 243, 33, 194)
      ..strokeWidth = 6;

    var c = Offset(size.width / 1.7, size.height / 1.4);
    canvas.drawCircle(c, 15, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class SmallestPaints extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Color.fromARGB(255, 243, 33, 194)
      ..strokeWidth = 6;

    var c = Offset(size.width / 1.5, size.height / 1.8);
    canvas.drawCircle(c, 8, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
