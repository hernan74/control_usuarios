import 'package:control_usuarios/src/utils/size_scream_util.dart';
import 'package:flutter/material.dart';

import 'package:control_usuarios/src/helpers/import_helpers.dart';

import 'package:control_usuarios/src/pages/home_page.dart';
import 'package:control_usuarios/src/helpers/estilos.dart' as estilo;

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double anchoMaximo = sizeScreemUtil(
        sizeActual: size.width * 90 / 100, sizeMin: 400, sizeMax: 650);
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height,
          child: Stack(
            alignment: Alignment.center,
            children: [
              FondoLoginWidget(),
              Container(
                width: anchoMaximo,
                height: 400,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Spacer(),
                    _Titulo(
                      ancho: anchoMaximo,
                    ),
                    _FormularioLogin(
                      anchoCampoTexto: anchoMaximo,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    _TextoErrorAutenticacion(),
                    Spacer(),
                    _BotonLogin(ancho: anchoMaximo),
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}

class _Titulo extends StatelessWidget {
  final double ancho;

  const _Titulo({this.ancho});
  @override
  Widget build(BuildContext context) {
    return OpacityAnimation(
      duration: Duration(seconds: 1),
      child: Container(
        width: ancho - 70,
        alignment: Alignment.centerRight,
        child: Text(
          'Ingresar',
          style: TextStyle(
              fontSize: estilo.sizeTituloLogin, color: estilo.colorTituloLogin),
        ),
      ),
    );
  }
}

class _FormularioLogin extends StatelessWidget {
  final double anchoCampoTexto;

  const _FormularioLogin({this.anchoCampoTexto});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextfieldWidget(
          icono: Icons.markunread_sharp,
          colorGradienteIconoInicio: estilo.colorPrimarioUno,
          colorGradienteIconoFin: estilo.colorPrimarioUnoGradiente,
          hindText: 'Email',
        ),
        SizedBox(
          height: 20,
        ),
        TextfieldWidget(
          iconoIzquida: true,
          icono: Icons.vpn_key_sharp,
          colorGradienteIconoInicio: estilo.colorPrimarioDos,
          colorGradienteIconoFin: estilo.colorPrimarioDosGradiente,
          hindText: 'Contraseña',
          obscureText: true,
        ),
      ],
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
    @required this.ancho,
  });

  final double ancho;

  @override
  Widget build(BuildContext context) {
    return ButtonWidget(
      widget: Text('Login',
          style: TextStyle(
              color: estilo.colorTextoBoton,
              fontWeight: FontWeight.bold,
              fontSize: estilo.sizeText)),
      ancho: ancho - 100,
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
