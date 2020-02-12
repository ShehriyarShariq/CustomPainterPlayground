import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Painter',
      debugShowCheckedModeBanner: false,
      home: PainterApp(),
    );
  }
}

class PainterApp extends StatefulWidget{
  @override
  _PainterAppState createState() => _PainterAppState();
}

class _PainterAppState extends State<PainterApp> {
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: CustomPaint(
        painter: MyPainter(),
        child: Center(),
      ),
    );   
  }

}

class MyPainter extends CustomPainter{
  
  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width =  size.width;

    Paint paint = Paint();
    Path bg = Path();
    bg.addRect(Rect.fromLTRB(0, 0, width, height));
    paint.color = Colors.black;
    canvas.drawPath(bg, paint);


    double radius = min(width/4, height/4);
    Paint color = Paint()
      ..color= Colors.white;
    Paint innerCircleColor = Paint()
      ..color = Colors.black;
    
    List<Offset> offsets = [];

    for(int i = 0; i < 3; i++){
      for(int j = 0; j < 3; j++){
        offsets.add(Offset(i * radius * 2, (i % 2 == 1 ? radius * 1.5 : 0) + (j * radius * 3)));
      }
    }

    offsets.forEach((center) { 
      Path eye = Path();
      eye.addOval(Rect.fromCircle(center: center, radius: radius));      
      
      Path innerEye = Path();
      innerEye.addOval(Rect.fromCircle(center: center, radius: radius * 0.99));          

      Path eyeUpper = Path();
      eyeUpper.moveTo(center.dx - (radius * 0.75), center.dy);
      eyeUpper.quadraticBezierTo(center.dx, center.dy - radius * 0.7, center.dx + (radius * 0.75), center.dy);
      eyeUpper.close();

      Path eyeLower = Path();
      eyeLower.moveTo(center.dx - radius * 0.75, center.dy);
      eyeLower.quadraticBezierTo(center.dx, center.dy + radius * 0.7, center.dx + (radius * 0.75), center.dy);
      eyeLower.close();

      Path pupil = Path();
      pupil.addOval(Rect.fromCircle(center: center, radius: radius * 0.2));   

      Path pupilInner = Path();
      pupilInner.addOval(Rect.fromCircle(center: center, radius: radius * 0.04));                 
      
      Path pupilGlisten = Path();
      pupilGlisten.moveTo(center.dx - radius * 0.15, center.dy - radius * 0.05);
      pupilGlisten.quadraticBezierTo(center.dx - radius * 0.1, center.dy - radius * 0.15, center.dx, center.dy - radius * 0.15);
      pupilGlisten.close();

      Path eyeLashLeftUpper = Path();
      eyeLashLeftUpper.moveTo(center.dx - radius * 0.5, center.dy);
      eyeLashLeftUpper.quadraticBezierTo(center.dx - radius * 0.6, center.dy - radius * 0.1, center.dx - radius * 0.5, center.dy - radius * 0.5);
      eyeLashLeftUpper.close();

      Path eyeLashMidUpper = Path();
      eyeLashMidUpper.moveTo(center.dx, center.dy - radius * 0.25);
      eyeLashMidUpper.quadraticBezierTo(center.dx - 10, center.dy - radius * 0.1, center.dx + 1, center.dy - radius * 0.6);
      eyeLashMidUpper.close();

      Path eyeLashRightUpper = Path();
      eyeLashRightUpper.moveTo(center.dx + radius * 0.5, center.dy);
      eyeLashRightUpper.quadraticBezierTo(center.dx + radius * 0.6, center.dy - radius * 0.1, center.dx + radius * 0.5, center.dy - radius * 0.5);
      eyeLashRightUpper.close();

      Path eyeLashLeftLower = Path();
      eyeLashLeftUpper.moveTo(center.dx - radius * 0.5, center.dy);
      eyeLashLeftUpper.quadraticBezierTo(center.dx - radius * 0.6, center.dy + radius * 0.1, center.dx - radius * 0.5, center.dy + radius * 0.5);
      eyeLashLeftUpper.close();

      Path eyeLashMidLower = Path();
      eyeLashMidUpper.moveTo(center.dx, center.dy + radius * 0.25);
      eyeLashMidUpper.quadraticBezierTo(center.dx + 10, center.dy + radius * 0.1, center.dx - 1, center.dy + radius * 0.6);
      eyeLashMidUpper.close();

      Path eyeLashRightLower = Path();
      eyeLashRightUpper.moveTo(center.dx + radius * 0.5, center.dy);
      eyeLashRightUpper.quadraticBezierTo(center.dx + radius * 0.6, center.dy + radius * 0.1, center.dx + radius * 0.5, center.dy + radius * 0.5);
      eyeLashRightUpper.close();


      canvas.drawPath(eye, color);
      canvas.drawPath(innerEye, innerCircleColor);
      canvas.drawPath(eyeUpper, color);
      canvas.drawPath(eyeLower, color);
      canvas.drawPath(pupil, innerCircleColor);
      canvas.drawPath(pupilInner, color);
      canvas.drawPath(pupilGlisten, color);
      canvas.drawPath(eyeLashLeftUpper, color);
      canvas.drawPath(eyeLashRightUpper, color);
      canvas.drawPath(eyeLashMidUpper, color);
      canvas.drawPath(eyeLashLeftLower, color);
      canvas.drawPath(eyeLashRightLower, color);
      canvas.drawPath(eyeLashMidLower, color);
    });

    // Path eyeUpper = Path();
    // eyeUpper.moveTo(0, height / 2);
    // eyeUpper.quadraticBezierTo(width * 0.45, height * 0.25, width * 0.5, height * 0.5);
    // // eyeUpper.close();

    // canvas.drawPath(eyeUpper, color);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
  
}
