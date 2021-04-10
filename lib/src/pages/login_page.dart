import 'package:flutter/material.dart';

import 'package:control_usuarios/src/pages/home_page.dart';
import 'package:control_usuarios/src/widget/trancicion_cambio_pagina_animation.dart';
import 'package:control_usuarios/src/widget/button_widget.dart';
import 'package:control_usuarios/src/widget/fondo_widget.dart';
import 'package:control_usuarios/src/widget/textfield_widget.dart';
import 'package:control_usuarios/src/widget/opacity_animation.dart';
import 'package:control_usuarios/src/helpers/estilos.dart' as estilo;

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            FondoWidget(),
            Positioned(top: size.height * 40 / 100, child: _FormularioLogin()),
            Positioned(
                top: size.height * 30 / 100, right: 30, child: _Titulo()),
            Positioned(
              top: size.height * 70 / 100,
              child: _BotonLogin(size: size),
            ),
            Positioned(
              top: size.height * 58 / 100,
              child: _TextoErrorAutenticacion(),
            )
          ],
        ),
      ),
    ));
  }
}

class _Titulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OpacityAnimation(
      duration: Duration(seconds: 1),
      child: Text(
        'Ingresar',
        style: TextStyle(
            fontSize: estilo.sizeTituloLogin, color: estilo.colorTituloLogin),
      ),
    );
  }
}

class _FormularioLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width - 60,
      height: 140,
      child: Column(
        children: <Widget>[
          TextfieldWidget(
            ancho: width - 70,
            icono: Icons.markunread_sharp,
            colorGradienteIconoInicio: estilo.colorPrimarioUno,
            colorGradienteIconoFin: estilo.colorPrimarioUnoGradiente,
            hindText: 'Email',
          ),
          SizedBox(
            height: 20,
          ),
          TextfieldWidget(
            ancho: width - 70,
            iconoIzquida: true,
            icono: Icons.vpn_key_sharp,
            colorGradienteIconoInicio: estilo.colorPrimarioDos,
            colorGradienteIconoFin: estilo.colorPrimarioDosGradiente,
            hindText: 'Contraseña',
            obscureText: true,
          ),
        ],
      ),
    );
  }
}

class _TextoErrorAutenticacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Contraseña incorrecta',
      style: TextStyle(
          fontSize: estilo.sizeTextError,
          color: estilo.colorError,
          fontWeight: FontWeight.bold),
    );
  }
}

class _BotonLogin extends StatelessWidget {
  const _BotonLogin({
    @required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return ButtonWidget(
      widget: Text('Login',
          style: TextStyle(
              color: estilo.colorTextoBoton,
              fontWeight: FontWeight.bold,
              fontSize: estilo.sizeText)),
      ancho: size.width - 60,
      alto: 50,
      utilizaGradiente: true,
      colorGradienteInicio: estilo.colorPrimarioDos,
      colorGradienteFinal: estilo.colorPrimarioUno,
      onPressed: () {
        Navigator.push(context, trancicionCambioPaginaAnimation(HomePage()));
      },
    );
  }
}
