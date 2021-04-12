import 'package:flutter/material.dart';

import 'package:control_usuarios/src/helpers/estilos.dart' as colores;

class FondoFormularioWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(
          gradient: RadialGradient(colors: [
        colores.colorPrimarioDos,
        colores.colorPrimarioDosGradiente,
        colores.colorPrimarioUno,
        colores.colorPrimarioUnoGradiente,
      ])),
      child: CustomPaint(
        painter: _HeaderPaiter(),
      ),
    );
  }
}

class _HeaderPaiter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    _crearFiguraBlancaConSombraPrincipal(canvas, size);
    _crearFiguraColorCentral(canvas, size);
    _crearfiguraColorInferior(canvas, size);
    _crearFiguraBlancaConSombraInferior(canvas, size);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  void _crearfiguraColorInferior(Canvas canvas, Size size) {
    final Rect rect =
        new Rect.fromCircle(center: Offset(0.0, 150.0), radius: 180);
    //Gradiente rosado
    final Gradient gradiente = new LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          colores.colorPrimarioDos,
          colores.colorPrimarioDosGradiente,
          colores.colorPrimarioUno,
          colores.colorPrimarioUnoGradiente,
        ]);
    final paint = new Paint()..shader = gradiente.createShader(rect);

    //Propiedades
    paint.style = PaintingStyle.fill; //stroke  fill
    paint.strokeWidth = 5;

    final path = new Path();

    path.moveTo(size.width * 0.7, size.height);
    path.quadraticBezierTo(size.width * 0.92, size.height * 0.85,
        size.width * 0.8, size.height * 0.72);
    path.lineTo(size.width, size.height * 0.81);
    path.lineTo(size.width, size.height);

    canvas.drawPath(path, paint);
  }

  void _crearFiguraColorCentral(Canvas canvas, Size size) {
    final Rect rect =
        new Rect.fromCircle(center: Offset(0.0, 150.0), radius: 180);
    //Gradiente rosado
    final Gradient gradiente = new LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          colores.colorPrimarioUno,
          colores.colorPrimarioUnoGradiente,
          colores.colorPrimarioDos,
          colores.colorPrimarioDosGradiente,
        ]);
    final paint = new Paint()..shader = gradiente.createShader(rect);
    //Propiedades
    paint.color = Colors.red;
    paint.style = PaintingStyle.fill; //stroke  fill
    paint.strokeWidth = 5;

    final path = new Path();

    path.moveTo(size.width, size.height * 0.32);
    path.quadraticBezierTo(size.width * 0.7, size.height * 0.5,
        size.width * 0.27, size.height * 0.5);
    path.quadraticBezierTo(
        size.width * 0.7, size.height * 0.7, size.width, size.height * 0.60);
    canvas.drawShadow(
        path.shift(Offset(-5, -40)), Colors.black.withOpacity(0.6), 15.0, true);

    canvas.drawPath(path, paint);
  }

  void _crearFiguraBlancaConSombraPrincipal(Canvas canvas, Size size) {
    final paint = new Paint();

    //Propiedades
    paint.color = Colors.white;
    paint.style = PaintingStyle.fill; //stroke  fill
    paint.strokeWidth = 5;

    final path = new Path();

    path.moveTo(size.width * 0.1, size.height * 0.5);
    path.quadraticBezierTo(
        size.width * 0.15, size.height * 0.25, size.width, size.height * 0.2);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width * 0.1, size.height);
    canvas.drawShadow(
        path.shift(Offset(-5, -40)), Colors.black.withOpacity(0.6), 15.0, true);

    canvas.drawPath(path, paint);
  }

  void _crearFiguraBlancaConSombraInferior(Canvas canvas, Size size) {
    final paint = new Paint();

    //Propiedades
    paint.color = Colors.white;
    paint.style = PaintingStyle.fill; //stroke  fill
    paint.strokeWidth = 5;

    final path = new Path();

    path.moveTo(size.width * 0.7, size.height);
    path.quadraticBezierTo(size.width * 0.92, size.height * 0.85,
        size.width * 0.8, size.height * 0.72);
    path.lineTo(size.width * 0.78, size.height * 0.72);
    path.lineTo(size.width * 0.6, size.height);
    canvas.drawShadow(
        path.shift(Offset(20, 0)), Colors.black.withOpacity(0.6), 15.0, true);

    canvas.drawPath(path, paint);
  }
}
