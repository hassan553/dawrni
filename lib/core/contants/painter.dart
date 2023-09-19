import 'package:dawrni/core/rescourcs/app_colors.dart';
import 'package:flutter/material.dart';
class RPSCustomPainter extends CustomPainter{
  
  @override
  void paint(Canvas canvas, Size size) {
    
  
  Paint paint_fill_0 = Paint()
      ..color = const Color.fromARGB(255, 255, 255, 255)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;
     
         
    Path path_0 = Path();
    path_0.moveTo(size.width*0.1912500,size.height*0.2000000);
    path_0.lineTo(size.width*0.4412500,size.height*0.1960000);
    path_0.lineTo(size.width*0.4375000,size.height*0.5980000);
    path_0.quadraticBezierTo(size.width*0.3490625,size.height*0.6620000,size.width*0.3125000,size.height*0.6480000);
    path_0.quadraticBezierTo(size.width*0.2706250,size.height*0.6595000,size.width*0.1887500,size.height*0.5960000);
    path_0.lineTo(size.width*0.1912500,size.height*0.2000000);
    path_0.close();

    canvas.drawPath(path_0, paint_fill_0);
  

  // Layer 1
  
  Paint paint_stroke_0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;
     
         
    
    canvas.drawPath(path_0, paint_stroke_0);
  
    
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}
