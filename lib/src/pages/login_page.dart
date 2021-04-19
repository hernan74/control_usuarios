import 'package:flutter/material.dart';

import 'package:control_usuarios/src/helpers/import_helpers.dart';

import 'package:control_usuarios/src/pages/home_page.dart';
import 'package:control_usuarios/src/utils/size_scream_util.dart';
import 'package:control_usuarios/src/helpers/estilos.dart' as estilo;

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double anchoMaximo = sizeScreemUtil(
        sizeActual: size.width * 90 / 100, sizeMin: 400, sizeMax: 650);
    double altoMaximo = sizeScreemUtil(
        sizeActual: size.height * 60 / 100, sizeMin: 252, sizeMax: 400);

    return SafeArea(
      child: Scaffold(
          body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            FondoLoginWidget(),
            Container(
              width: anchoMaximo,
              height: altoMaximo,
              child: GridViewWidget(
                maxWidth: anchoMaximo,
                widthItem: anchoMaximo - 20,
                maxHeightItem: altoMaximo,
                listaElementos: [
                  Column(
                    children: <Widget>[
                      Spacer(),
                      _Titulo(
                        anchoMaximo: anchoMaximo,
                        altoMaximo: altoMaximo,
                      ),
                      _FormularioLogin(
                        altoMaximo: altoMaximo,
                      ),
                      SizedBox(
                          height: sizeScreemUtil(
                              sizeActual: altoMaximo * 5 / 100,
                              sizeMin: 0,
                              sizeMax: 20)),
                      _TextoErrorAutenticacion(
                        altoMaximo: altoMaximo,
                      ),
                      Spacer(),
                      _BotonLogin(
                        anchoMaximo: anchoMaximo,
                        altoMaximo: altoMaximo,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}

class _Titulo extends StatelessWidget {
  final double anchoMaximo;
  final double altoMaximo;

  const _Titulo({@required this.anchoMaximo, @required this.altoMaximo});
  @override
  Widget build(BuildContext context) {
    return OpacityAnimation(
      duration: Duration(seconds: 1),
      child: Container(
        width: anchoMaximo * 95 / 100,
        alignment: Alignment.centerRight,
        child: Text(
          'Ingreso',
          style: TextStyle(
              fontSize: sizeScreemUtil(
                  sizeActual: altoMaximo * 10 / 100, sizeMin: 20, sizeMax: 40),
              color: estilo.colorTituloLogin),
        ),
      ),
    );
  }
}

class _FormularioLogin extends StatelessWidget {
  final double altoMaximo;

  const _FormularioLogin({this.altoMaximo});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextfieldWidget(
          alto: sizeScreemUtil(
              sizeActual: altoMaximo * 15 / 100, sizeMin: 10, sizeMax: 55),
          icono: Icons.markunread_sharp,
          colorGradienteIconoInicio: estilo.colorPrimarioUno,
          colorGradienteIconoFin: estilo.colorPrimarioUnoGradiente,
          hintTextSize: sizeScreemUtil(
              sizeActual: altoMaximo * 5.5 / 100, sizeMin: 10, sizeMax: 22),
          hindText: 'Email',
        ),
        SizedBox(
          height: sizeScreemUtil(
              sizeActual: altoMaximo * 4.5 / 100, sizeMin: 10, sizeMax: 20),
        ),
        TextfieldWidget(
          alto: sizeScreemUtil(
              sizeActual: altoMaximo * 15 / 100, sizeMin: 10, sizeMax: 55),
          iconoIzquida: true,
          icono: Icons.vpn_key_sharp,
          colorGradienteIconoInicio: estilo.colorPrimarioDos,
          colorGradienteIconoFin: estilo.colorPrimarioDosGradiente,
          hindText: 'Contraseña',
          hintTextSize: sizeScreemUtil(
              sizeActual: altoMaximo * 5.5 / 100, sizeMin: 10, sizeMax: 22),
          obscureText: true,
        ),
      ],
    );
  }
}

class _TextoErrorAutenticacion extends StatelessWidget {
  final double altoMaximo;

  const _TextoErrorAutenticacion({Key key, @required this.altoMaximo})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      'Contraseña incorrecta',
      style: TextStyle(
          fontSize: sizeScreemUtil(
              sizeActual: altoMaximo * 4.8 / 100, sizeMin: 10, sizeMax: 22),
          color: estilo.colorError,
          fontWeight: FontWeight.bold),
    );
  }
}

class _BotonLogin extends StatelessWidget {
  const _BotonLogin({
    @required this.anchoMaximo,
    @required this.altoMaximo,
  });

  final double anchoMaximo;
  final double altoMaximo;

  @override
  Widget build(BuildContext context) {
    return ButtonWidget(
      widget: Text('Login',
          style: TextStyle(
              color: estilo.colorTextoBoton,
              fontWeight: FontWeight.bold,
              fontSize: sizeScreemUtil(
                  sizeActual: altoMaximo * 5.5 / 100,
                  sizeMin: 10,
                  sizeMax: 22))),
      ancho: anchoMaximo * 70 / 100,
      alto: altoMaximo * 12 / 100,
      utilizaGradiente: true,
      colorGradienteInicio: estilo.colorPrimarioDos,
      colorGradienteFinal: estilo.colorPrimarioUno,
      onPressed: () {
        Navigator.push(context, trancicionCambioPaginaAnimation(HomePage()));
      },
    );
  }
}
