import 'package:flutter/material.dart';
import 'dart:ui' as ui;

void main() {
  runApp(const MaterialApp(home: GkBottomNavbar()));
}

class GkBottomNavbar extends StatefulWidget {
  const GkBottomNavbar({Key? key}) : super(key: key);

  @override
  State<GkBottomNavbar> createState() => _GkBottomNavbarState();
}

class _GkBottomNavbarState extends State<GkBottomNavbar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: false,
      child: Scaffold(
        body: bodyWrapper(context),
      ),
    );
  }

  SizedBox bodyWrapper(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: bottomNavigationStack(context),
    );
  }

  Stack bottomNavigationStack(BuildContext context) {
    return Stack(
      children: [
        bottomNavigationBackCP(context),
        bottomNavigationTopCP(),
        addButton()
      ],
    );
  }

  Positioned addButton() {
    return Positioned(
      bottom: 10,
      left: 0,
      right: 0,
      child: addButtonAlignBottom(),
    );
  }

  Align addButtonAlignBottom() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            const Color(0xff000000).withOpacity(0.4),
            const Color(0xffFFFFFF).withOpacity(0.4)
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(100),
        ),
        child: addButtonDecorationOne(),
      ),
    );
  }

  Container addButtonDecorationOne() {
    List<BoxShadow> boxShadows = [
      BoxShadow(
          color: Colors.white.withOpacity(0.3),
          blurRadius: 20.0,
          spreadRadius: 0,
          offset: const Offset(-10, -10)),
      BoxShadow(
          color: const Color(0xff0D1431).withOpacity(0.5),
          blurRadius: 20.0,
          spreadRadius: 0,
          offset: const Offset(10, 10)),
    ];

    return Container(
      margin: const EdgeInsets.all(5.0),
      height: 80,
      width: 80,
      decoration: BoxDecoration(
        boxShadow: boxShadows,
        gradient: const LinearGradient(
            colors: [Color(0xffF5F5F9), Color(0xffDADFE7)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
        borderRadius: BorderRadius.circular(100),
      ),
      child: addButtonDecorationTwo(),
    );
  }

  Container addButtonDecorationTwo() {
    return Container(
      margin: const EdgeInsets.all(5.0),
      height: 80,
      width: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        gradient: LinearGradient(colors: [
          const Color(0xffFFFFFF).withOpacity(0),
          const Color(0xffBBBFC7)
        ], begin: Alignment.topLeft, end: Alignment.bottomRight),
      ),
      child: addButtonDecorationThree(),
    );
  }

  Container addButtonDecorationThree() {
    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100), color: Colors.white),
      child: const Icon(
        Icons.add_rounded,
        size: 40.0,
        color: Color(0xff48319D),
      ),
    );
  }

  Positioned bottomNavigationTopCP() {
    return Positioned(
      bottom: -1,
      left: 0,
      right: 0,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: CustomPaint(
          size: const Size(258.0, 100.0),
          painter: GkClipper(),
        ),
      ),
    );
  }

  Positioned bottomNavigationBackCP(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: CustomPaint(
        size: Size(
            MediaQuery.of(context).size.width,
            (MediaQuery.of(context).size.width * 0.2282051282051282)
                .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
        painter: RPSCustomPainter(),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 10,
          child: Padding(
            padding: const EdgeInsets.only(left: 40.0, right: 40.0, top: 20.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(
                    Icons.location_pin,
                    color: Colors.white,
                    size: 30.0,
                  ),
                  Icon(
                    Icons.list,
                    color: Colors.white,
                    size: 30.0,
                  )
                ]),
          ),
        ),
      ),
    );
  }
}

//Copy this CustomPainter code to the Bottom of the File
class GkClipper extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.4210526, 0);
    path_0.lineTo(size.width * 0.5789474, 0);
    path_0.cubicTo(
        size.width * 0.6992481,
        0,
        size.width * 0.7349662,
        size.height * 0.2413980,
        size.width * 0.7734323,
        size.height * 0.4869850);
    path_0.cubicTo(
        size.width * 0.8132519,
        size.height * 0.7412470,
        size.width * 0.8533835,
        size.height,
        size.width * 0.9849624,
        size.height);
    path_0.lineTo(size.width * 0.01503876, size.height);
    path_0.cubicTo(
        size.width * 0.1466177,
        size.height,
        size.width * 0.1867504,
        size.height * 0.7412470,
        size.width * 0.2265718,
        size.height * 0.4869850);
    path_0.cubicTo(size.width * 0.2650342, size.height * 0.2413980,
        size.width * 0.3007530, 0, size.width * 0.4210526, 0);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.shader = ui.Gradient.linear(
        Offset(size.width * 0.6902820, size.height),
        Offset(size.width * 0.6902820, 0),
        [Color(0xff262C51).withOpacity(1), Color(0xff3E3F74).withOpacity(1)],
        [0, 1]);
    canvas.drawPath(path_0, paint_0_fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.4210526, size.height * 0.002500000);
    path_1.lineTo(size.width * 0.5789474, size.height * 0.002500000);
    path_1.cubicTo(
        size.width * 0.6388083,
        size.height * 0.002500000,
        size.width * 0.6775564,
        size.height * 0.06249740,
        size.width * 0.7061579,
        size.height * 0.1530060);
    path_1.cubicTo(
        size.width * 0.7338722,
        size.height * 0.2406970,
        size.width * 0.7520789,
        size.height * 0.3570410,
        size.width * 0.7706541,
        size.height * 0.4757500);
    path_1.cubicTo(
        size.width * 0.7712895,
        size.height * 0.4798130,
        size.width * 0.7719248,
        size.height * 0.4838790,
        size.width * 0.7725639,
        size.height * 0.4879470);
    path_1.lineTo(size.width * 0.7729511, size.height * 0.4904180);
    path_1.cubicTo(
        size.width * 0.7927180,
        size.height * 0.6166520,
        size.width * 0.8127068,
        size.height * 0.7442740,
        size.width * 0.8440789,
        size.height * 0.8404790);
    path_1.cubicTo(
        size.width * 0.8705752,
        size.height * 0.9217320,
        size.width * 0.9051767,
        size.height * 0.9805450,
        size.width * 0.9545451,
        size.height * 0.9975000);
    path_1.lineTo(size.width * 0.04545752, size.height * 0.9975000);
    path_1.cubicTo(
        size.width * 0.09482632,
        size.height * 0.9805450,
        size.width * 0.1294286,
        size.height * 0.9217320,
        size.width * 0.1559244,
        size.height * 0.8404790);
    path_1.cubicTo(
        size.width * 0.1872962,
        size.height * 0.7442730,
        size.width * 0.2072831,
        size.height * 0.6166510,
        size.width * 0.2270523,
        size.height * 0.4904170);
    path_1.lineTo(size.width * 0.2274391, size.height * 0.4879470);
    path_1.cubicTo(
        size.width * 0.2280763,
        size.height * 0.4838790,
        size.width * 0.2287124,
        size.height * 0.4798130,
        size.width * 0.2293481,
        size.height * 0.4757510);
    path_1.cubicTo(
        size.width * 0.2479233,
        size.height * 0.3570410,
        size.width * 0.2661286,
        size.height * 0.2406970,
        size.width * 0.2938429,
        size.height * 0.1530060);
    path_1.cubicTo(
        size.width * 0.3224474,
        size.height * 0.06249740,
        size.width * 0.3611932,
        size.height * 0.002500000,
        size.width * 0.4210526,
        size.height * 0.002500000);
    path_1.close();

    Paint paint_1_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.001879699;
    paint_1_stroke.color = Color(0xff7582F4);
    canvas.drawPath(path_1, paint_1_stroke);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

//Add this CustomPaint widget to the Widget Tree

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, size.height * 0.01123596);
    path_0.cubicTo(
        0,
        size.height * 0.01123596,
        size.width * 0.1950690,
        size.height * 0.1908112,
        size.width * 0.3256410,
        size.height * 0.2359551);
    path_0.cubicTo(
        size.width * 0.3931769,
        size.height * 0.2593056,
        size.width * 0.4321897,
        size.height * 0.2696629,
        size.width * 0.5000000,
        size.height * 0.2696629);
    path_0.cubicTo(
        size.width * 0.5678103,
        size.height * 0.2696629,
        size.width * 0.6042590,
        size.height * 0.2593056,
        size.width * 0.6717949,
        size.height * 0.2359551);
    path_0.cubicTo(size.width * 0.8023667, size.height * 0.1908112, size.width,
        size.height * 0.01123596, size.width, size.height * 0.01123596);
    path_0.lineTo(size.width, size.height);
    path_0.lineTo(0, size.height);
    path_0.lineTo(0, size.height * 0.01123596);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.shader = ui.Gradient.linear(
        Offset(size.width * 0.6961795, size.height * 0.01123596),
        Offset(size.width * 0.6961795, size.height),
        [Color(0xff3A3A6A).withOpacity(1), Color(0xff25244C).withOpacity(1)],
        [0, 1]);
    canvas.drawPath(path_0, paint_0_fill);

    Path path_1 = Path();
    path_1.moveTo(0, size.height * 0.01123596);
    path_1.lineTo(size.width * 0.0001317892, size.height * 0.008486978);
    path_1.lineTo(size.width * -0.0006410256, size.height * 0.007775539);
    path_1.lineTo(size.width * -0.0006410256, size.height * 0.01123596);
    path_1.lineTo(size.width * -0.0006410256, size.height);
    path_1.lineTo(size.width * -0.0006410256, size.height * 1.002809);
    path_1.lineTo(0, size.height * 1.002809);
    path_1.lineTo(size.width, size.height * 1.002809);
    path_1.lineTo(size.width * 1.000641, size.height * 1.002809);
    path_1.lineTo(size.width * 1.000641, size.height);
    path_1.lineTo(size.width * 1.000641, size.height * 0.01123596);
    path_1.lineTo(size.width * 1.000641, size.height * 0.007784764);
    path_1.lineTo(size.width * 0.9998692, size.height * 0.008485472);
    path_1.lineTo(size.width, size.height * 0.01123596);
    path_1.cubicTo(
        size.width * 0.9998692,
        size.height * 0.008485472,
        size.width * 0.9998692,
        size.height * 0.008486135,
        size.width * 0.9998667,
        size.height * 0.008487483);
    path_1.lineTo(size.width * 0.9998615, size.height * 0.008493584);
    path_1.lineTo(size.width * 0.9998333, size.height * 0.008518022);
    path_1.lineTo(size.width * 0.9997256, size.height * 0.008615438);
    path_1.lineTo(size.width * 0.9993000, size.height * 0.009001247);
    path_1.cubicTo(
        size.width * 0.9989231,
        size.height * 0.009342146,
        size.width * 0.9983590,
        size.height * 0.009848820,
        size.width * 0.9976205,
        size.height * 0.01051170);
    path_1.cubicTo(
        size.width * 0.9961410,
        size.height * 0.01183742,
        size.width * 0.9939564,
        size.height * 0.01378798,
        size.width * 0.9911256,
        size.height * 0.01628663);
    path_1.cubicTo(
        size.width * 0.9854692,
        size.height * 0.02128393,
        size.width * 0.9772410,
        size.height * 0.02847371,
        size.width * 0.9669564,
        size.height * 0.03724258);
    path_1.cubicTo(
        size.width * 0.9463923,
        size.height * 0.05478067,
        size.width * 0.9176103,
        size.height * 0.07863494,
        size.width * 0.8847513,
        size.height * 0.1038997);
    path_1.cubicTo(
        size.width * 0.8190256,
        size.height * 0.1544337,
        size.width * 0.7370000,
        size.height * 0.2105933,
        size.width * 0.6717436,
        size.height * 0.2331551);
    path_1.cubicTo(
        size.width * 0.6042154,
        size.height * 0.2565022,
        size.width * 0.5677872,
        size.height * 0.2668539,
        size.width * 0.5000000,
        size.height * 0.2668539);
    path_1.cubicTo(
        size.width * 0.4322128,
        size.height * 0.2668539,
        size.width * 0.3932179,
        size.height * 0.2565011,
        size.width * 0.3256923,
        size.height * 0.2331551);
    path_1.cubicTo(
        size.width * 0.2604385,
        size.height * 0.2105933,
        size.width * 0.1790523,
        size.height * 0.1544337,
        size.width * 0.1139679,
        size.height * 0.1039004);
    path_1.cubicTo(
        size.width * 0.08142821,
        size.height * 0.07863584,
        size.width * 0.05296846,
        size.height * 0.05478169,
        size.width * 0.03264359,
        size.height * 0.03724382);
    path_1.cubicTo(
        size.width * 0.02248121,
        size.height * 0.02847494,
        size.width * 0.01435272,
        size.height * 0.02128528,
        size.width * 0.008765077,
        size.height * 0.01628798);
    path_1.cubicTo(
        size.width * 0.005971256,
        size.height * 0.01378933,
        size.width * 0.003812667,
        size.height * 0.01183888,
        size.width * 0.002352662,
        size.height * 0.01051312);
    path_1.cubicTo(
        size.width * 0.001622659,
        size.height * 0.009850270,
        size.width * 0.001067303,
        size.height * 0.009343607,
        size.width * 0.0006945179,
        size.height * 0.009002719);
    path_1.lineTo(size.width * 0.0002732564, size.height * 0.008616921);
    path_1.lineTo(size.width * 0.0001671764, size.height * 0.008519517);
    path_1.lineTo(size.width * 0.0001406000, size.height * 0.008495079);
    path_1.lineTo(size.width * 0.0001339682, size.height * 0.008488978);
    path_1.cubicTo(
        size.width * 0.0001325074,
        size.height * 0.008487629,
        size.width * 0.0001317892,
        size.height * 0.008486978,
        0,
        size.height * 0.01123596);
    path_1.close();

    Paint paint_1_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.001282051;
    paint_1_stroke.color = Color(0xff7582F4).withOpacity(0.5);
    canvas.drawPath(path_1, paint_1_stroke);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
