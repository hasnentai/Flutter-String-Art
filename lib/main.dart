import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Offset mousePointer = const Offset(0.0, 0.0);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          height: 600,
          width: 600,
          color: Colors.black,
          child: MouseRegion(
            onEnter: (event) {},
            onExit: (event) {},
            onHover: (event) {
              setState(() {
                mousePointer = event.localPosition;
              });
            },
            child: CustomPaint(
              painter: Curves(mousePointer: mousePointer),
            ),
          ),
        ),
      ),
    );
  }
}

class Curves extends CustomPainter {
  Offset mousePointer;
  Curves({required this.mousePointer});

  List<Offset> offSets = [];
  List<List<Offset>> OffsetList = [];

  void quadratic(p0, p1, p2, t) {}

  @override
  void paint(Canvas canvas, Size size) {
    Offset p0 = const Offset(0, 300);
    Offset p1 = Offset(mousePointer.dx, mousePointer.dy);
    Offset p2 = const Offset(400, 0);
    Offset p3 = const Offset(600, 300);

    double delta = 0.05;

    Path p = Path();
    p.moveTo(0, 300);

    Paint paint1Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..color = Colors.white;

    for (double t = 0; t <= 1.00001; t += delta) {
      paint1Stroke.color =
          HSVColor.fromAHSV(1, (t  * 360).roundToDouble(), 1, 1).toColor();

      double x1 = lerpDouble(p0.dx, p1.dx, t) as double;
      double y1 = lerpDouble(p0.dy, p1.dy, t) as double;
      double x2 = lerpDouble(p1.dx, p2.dx, t) as double;
      double y2 = lerpDouble(p1.dy, p2.dy, t) as double;
      double x = lerpDouble(x1, x2, t) as double;
      double y = lerpDouble(y1, y2, t) as double;
      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), paint1Stroke);
      offSets.add(Offset(x, y));
    }

    Vertices v1 = Vertices(VertexMode.triangleStrip, offSets);
    canvas.drawVertices(v1, BlendMode.clear, paint1Stroke);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
