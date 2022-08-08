import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:untitled/example/processing/random_vectors.dart';

void main() {
  runApp(const MaterialApp(home: RandomVector()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  Offset mousePointer = const Offset(0.0, 0.0);
  late AnimationController _controller;
  List<Partical> _partical = [];
  static const double height = 600.0;
  static const double width = 600.0;
  Size size = const Size(height, width);

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: const Duration(days: 365));
    _controller.forward();
    Partical p0 = Partical(x: 0, y: 300, size: size);
    Partical p1 = Partical(x: 300, y: 0, size: size);
    Partical p2 = Partical(x: 400, y: 0, size: size);
    Partical p3 = Partical(x: 600, y: 200, size: size);

    _partical.add(p0);
    _partical.add(p1);
    _partical.add(p2);
    _partical.add(p3);
    _controller.addListener(() {
      p0.update();
      p1.update();
      p2.update();
      p3.update();
    });
  }

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
            child: AnimatedBuilder(
                animation: _controller,
                builder: ((context, child) {
                  return CustomPaint(
                    painter:
                        Curves(mousePointer: mousePointer, partical: _partical),
                  );
                })),
          ),
        ),
      ),
    );
  }
}

class Curves extends CustomPainter {
  Offset mousePointer;
  List<Partical> partical;
  Curves({required this.mousePointer, required this.partical});

  List<Offset> offSets = [];
  List<Offset> offSets1 = [];

  Offset quadratic(
      Partical p0, Partical p1, Partical p2, t, Canvas canvas, Paint paint) {
    double x1 = lerpDouble(p0.x, p1.x, t) as double;
    double y1 = lerpDouble(p0.y, p1.y, t) as double;
    double x2 = lerpDouble(p1.x, p2.x, t) as double;
    double y2 = lerpDouble(p1.y, p2.y, t) as double;
    double x = lerpDouble(x1, x2, t) as double;
    double y = lerpDouble(y1, y2, t) as double;
    canvas.drawLine(Offset(x1, y1), Offset(x2, y2), paint);
    return Offset(x, y);
  }

  Offset cubic(p0, p1, p2, p3, t, Canvas canvas, Paint paint) {
    Offset v1 = quadratic(p0, p1, p2, t, canvas, paint);
    Offset v2 = quadratic(p1, p2, p3, t, canvas, paint);
    double x = lerpDouble(v1.dx, v2.dx, t) as double;
    double y = lerpDouble(v1.dy, v2.dy, t) as double;
    canvas.drawLine(v1, v2, paint);
    return Offset(x, y);
  }

  @override
  void paint(Canvas canvas, Size size) {
    Partical p0 = partical[0];
    Partical p1 = partical[1];
    Partical p2 = partical[2];
    Partical p3 = partical[3];

    double delta = 0.05;

    Path p = Path();
    p.moveTo(0, 300);

    Paint paint1Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..color = Colors.white;

    for (double t = 0; t <= 1.00001; t += delta) {
      paint1Stroke.color =
          HSVColor.fromAHSV(0.5, (t * 360).roundToDouble(), 1, 1).toColor();

      offSets.add(cubic(p0, p1, p2, p3, t, canvas, paint1Stroke));
    }

    Vertices v1 = Vertices(VertexMode.triangles, offSets);
    canvas.drawVertices(v1, BlendMode.clear, paint1Stroke);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}

class Partical {
  Random random = Random();
  late double x;
  late double y;
  late int dx = random.nextInt(3 - (-3));
  late int dy = random.nextInt(3 - (-3));
  Size size;

  Partical({required this.x, required this.y, required this.size});

  void update() {
    x += dx;
    y += dy;
    if (x >= size.width || y < 0) {
      dx *= -1;
    }
    if (y >= size.height || y < 0) {
      dy *= -1;
    }
  }
}
