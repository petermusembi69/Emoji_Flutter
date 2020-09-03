import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';


final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: MyWidget(),
        ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  final double percentage = 0.4;
  @override
  Widget build(BuildContext context) {
    return Column(children:[
      Text('Hello, World!', style: Theme.of(context).textTheme.headline4),      SizedBox(height:10),
      Container(child:CustomPaint(foregroundPainter: TearDrop(),painter: CircularPath(percentage),child:Center(child:Text(''),),),height: 300,width: 300),
    ]);
  }
}


class TearDrop extends CustomPainter{
  
  @override
  void paint(Canvas canvas,Size size){
    final paint = Paint();
    paint.color = Colors.blue;
    paint.strokeWidth = 10;
    var center = size.width/2;
    
   canvas.drawArc(Rect.fromLTWH(center-size.width/2.5,center-size.width/2.5,40,120),pi/3,2*pi/5 , true, paint);
  
}
  
  @override
 bool shouldRepaint(CustomPainter old) {
    return false;
  }
}

class CircularPath extends CustomPainter{
  final percentage;
  
  CircularPath(this.percentage);
  
  @override
  void paint(Canvas canvas,Size size){
    final paint = Paint();
    paint.color = Colors.black;
    paint.strokeWidth = 10;
    paint.style = PaintingStyle.stroke;
    final paintk = Paint();
    paintk.color = Colors.red;
    paintk.strokeWidth = 10;
    paintk.style = PaintingStyle.stroke;
        final paintc = Paint();
    paintc.color = Colors.yellow;
    var center = size.width/2;
        final painty = Paint();
    painty.color = Colors.brown;
    painty.strokeWidth = 2;
    painty.style = PaintingStyle.stroke;

    
    canvas.drawCircle(Offset(center,center),size.width/2, paintc);
    
canvas.drawArc(Rect.fromCircle(center: Offset(center,center), radius: size.width/4),0,pi, false, paint);
    //    canvas.drawArc(Rect.fromLTWH(center/2,center/2,size.width/2,size.height/2),pi/4,pi/2, false, paint);
        canvas.drawCircle(Offset(center- center/3,center -center/3),30,Paint()..color = Colors.white);
    canvas.drawArc(Rect.fromLTWH((center-center/3)-30,(center- center/3)-30,60,60),0,pi * 2 , false, painty);
    canvas.drawCircle(Offset(center- center/3,center -center/4),10,Paint()..color = Colors.black);
canvas.drawCircle(Offset(center+ center/3,center -center/3),40,Paint()..color = Colors.white);
     canvas.drawArc(Rect.fromLTWH((center+ center/3)-40,(center -center/3)-40,80,80),0,pi * 2 , false, painty);
        canvas.drawCircle(Offset(center+ center/3,center -center/2.5),10,Paint()..color = Colors.black);
//    canvas.drawArc(Rect.fromLTWH(0,0,size.width,size.height),-pi/2,-2* pi * percentage , false, paintk);
  }
  
  @override
 bool shouldRepaint(CustomPainter old) {
    return false;
  }
}
