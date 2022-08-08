import 'package:flutter/material.dart';
import 'package:flutter_processing/flutter_processing.dart';

class RandomVector extends StatefulWidget {
  const RandomVector({Key? key}) : super(key: key);

  @override
  State<RandomVector> createState() => _RandomVectorState();
}

class _RandomVectorState extends State<RandomVector> {
  @override
  Widget build(BuildContext context) {
    return Processing(sketch: MySketch(width: 600, height: 600));
  }
}

class MySketch extends Sketch {
  MySketch({required this.width, required this.height});

  @override
  late final int width;
  @override
  late final int height;

  @override
  void setup() {
    size(width: width, height: height);
    background(color: Colors.black);
  }

  @override
  void draw() {
    Offset v = Offset(random(0, 1), random(0, 1));

    translate(x: width / 2, y: height / 2);
    strokeWeight(4.0);
    stroke(color: Color.fromARGB(22, 255, 255, 255));
    line(const Offset(0, 0),
        Offset(v.dx * random(-100, 100), v.dx * random(-100, 100)));
  }
}
