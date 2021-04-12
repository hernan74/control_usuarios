import 'package:flutter/material.dart';

import 'package:control_usuarios/src/helpers/estilos.dart' as colores;

class FondoHomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      child: CustomPaint(
        painter: _HeaderPaiter(),
      ),
    );
  }
}

class _HeaderPaiter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    _crearfiguraColorSuperior(canvas, size);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  void _crearfiguraColorSuperior(Canvas canvas, Size size) {
    final Rect rect =
        new Rect.fromCircle(center: Offset(0.0, 150.0), radius: 180);
    //Gradiente rosado
    final Gradient gradiente = new LinearGradient(
      begin: Alignment.bottomRight,
      end: Alignment.topLeft,
      colors: [
        colores.colorPrimarioDos,
        colores.colorPrimarioDosGradiente,
        colores.colorPrimarioUno,
        colores.colorPrimarioUnoGradiente,
      ],
    );
    final paint = new Paint()..shader = gradiente.createShader(rect);

    //Propiedades
    paint.style = PaintingStyle.fill; //stroke  fill
    paint.strokeWidth = 5;

    final path = new Path();

    path.moveTo(0, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.05, size.height * 0.15,
        size.width * 0.25, size.height * 0.15);
    path.lineTo(size.width * 0.75, size.height * 0.15);
    path.quadraticBezierTo(
        size.width * 0.95, size.height * 0.15, size.width, size.height * 0.05);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    canvas.drawPath(path, paint);
  }
}
