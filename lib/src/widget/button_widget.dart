import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final Widget widget;
  final Color fondo1;
  final Color fondo2;
  final double ancho;
  final double alto;
  final double elevacion;
  final double bordeRedondeado;
  final Function onPressed;
  final bool usaGradiente;
  
  const ButtonWidget(
      {@required this.widget,
      this.fondo1 = Colors.grey,
      this.ancho = 70,
      this.alto = 70,
      this.elevacion = 0,
      this.bordeRedondeado = 20,
      this.onPressed,
      this.usaGradiente = false,
      this.fondo2 = Colors.grey});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        child: Container(
          width: ancho,
          height: alto,
          decoration: BoxDecoration(
            color: fondo1,
            borderRadius: BorderRadius.circular(bordeRedondeado),
            gradient: LinearGradient(
              colors: usaGradiente
                  ? <Color>[
                      fondo1,
                      fondo2,
                    ]
                  : [fondo1, fondo1],
            ),
          ),
          child: widget,
          alignment: Alignment.center,
        ),
        style: ButtonStyle(
            minimumSize: MaterialStateProperty.all<Size>(Size(ancho, alto)),
            elevation: MaterialStateProperty.all<double>(elevacion),
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(bordeRedondeado)))));
  }
}
