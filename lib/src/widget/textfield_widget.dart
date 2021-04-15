import 'package:control_usuarios/src/test/MeasureSize.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:control_usuarios/src/widget/cambio_size_animation.dart';
import 'opacity_animation.dart';
import 'package:control_usuarios/src/helpers/estilos.dart' as estilo;

class TextfieldWidget extends StatelessWidget {
  final double alto;
  final double ancho;
  final IconData icono;
  final bool iconoIzquida;
  final Color colorGradienteIconoInicio;
  final Color colorGradienteIconoFin;
  final String hindText;
  final TextAlign alineacionTexto;
  final bool obscureText;
  final TextInputType textInputType;
  final TextEditingController controller;
  final bool enableInteractiveSelection;
  final Function onTap;

  const TextfieldWidget(
      {this.alto = 60,
      this.ancho = 250,
      this.icono = Icons.ac_unit,
      this.iconoIzquida = false,
      this.colorGradienteIconoInicio = Colors.grey,
      this.hindText = '',
      this.colorGradienteIconoFin = Colors.grey,
      this.alineacionTexto = TextAlign.center,
      this.obscureText = false,
      this.textInputType = TextInputType.text,
      this.controller,
      this.enableInteractiveSelection = true,
      this.onTap});

  @override
  Widget build(BuildContext contextText) {
    //Esto se hace para poder redibujar el tamaño del componente de forma correcta al ir agrandando la ventana en un navegador web
    double redibujarAncho = this.ancho;
    double redibujarAlto = this.alto;

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      child: Container(
        width: redibujarAncho,
        height: redibujarAlto - 12,
        decoration: BoxDecoration(
          color: this.colorGradienteIconoInicio,
          borderRadius: BorderRadius.circular(50),
          gradient: LinearGradient(colors: <Color>[
            this.colorGradienteIconoFin,
            this.colorGradienteIconoInicio.withOpacity(0.9),
          ], stops: [
            0.8,
            1.0
          ]),
        ),
        child: Row(
          children: <Widget>[
            if (this.iconoIzquida)
              _IconoTextfield(alto: redibujarAlto, icono: this.icono),
            Expanded(
              child: _CampoTexto(
                hindText: this.hindText,
                alineacionTexto: this.alineacionTexto,
                obscureText: this.obscureText,
                textInputType: this.textInputType,
                controller: this.controller,
                enableInteractiveSelection: this.enableInteractiveSelection,
                onTap: this.onTap,
              ),
            ),
            if (!this.iconoIzquida)
              _IconoTextfield(alto: redibujarAlto, icono: this.icono),
          ],
        ),
      ),
    );
  }
}

class _IconoTextfield extends StatelessWidget {
  const _IconoTextfield({
    @required this.alto,
    @required this.icono,
  });

  final double alto;
  final IconData icono;

  @override
  Widget build(BuildContext context) {
    return CambioSizeAnimation(
      sizeFinal: 40,
      sizeIniciar: 0,
      child: Container(
        width: 40,
        height: this.alto,
        alignment: Alignment.center,
        child: OpacityAnimation(
          duration: Duration(milliseconds: 1300),
          child: FaIcon(
            this.icono,
            color: estilo.colorIconos,
          ),
        ),
      ),
    );
  }
}

class _CampoTexto extends StatelessWidget {
  const _CampoTexto({
    @required this.hindText,
    this.alineacionTexto,
    this.obscureText,
    this.textInputType,
    this.controller,
    this.enableInteractiveSelection,
    this.onTap,
  });

  final String hindText;
  final TextAlign alineacionTexto;
  final bool obscureText;
  final TextInputType textInputType;
  final TextEditingController controller;
  final bool enableInteractiveSelection;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(width: 0, color: Colors.white),
        ),
        padding: EdgeInsets.all(0),
        child: TextField(
          textCapitalization: TextCapitalization.sentences,
          keyboardType: this.textInputType,
          obscureText: this.obscureText,
          textAlign: this.alineacionTexto,
          controller: this.controller,
          style: TextStyle(
            fontSize: estilo.sizeText,
          ),
          decoration: new InputDecoration(
            hintText: this.hindText,
            hintStyle: TextStyle(
                fontSize: estilo.sizeText,
                fontWeight: FontWeight.bold,
                color: Colors.grey),
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(
                left: this.alineacionTexto == TextAlign.start ? 15 : 0),
          ),
          onTap: onTap,
        ));
  }
}