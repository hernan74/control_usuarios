import 'package:control_usuarios/src/widget/button_widget.dart';
import 'package:control_usuarios/src/widget/textfield_widget.dart';
import 'package:flutter/material.dart';

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
            Positioned(top: size.height * 40 / 100, child: _FormularioLogin()),
            ButtonWidget(
              widget: Text('Login'),
              ancho: size.width - 60,
              alto: 50,
              usaGradiente: true,
              fondo1: Color(0xffDF596C),
              fondo2: Color(0xffFFB239),
            )
          ],
        ),
      ),
    ));
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
            colorFondo: Color(0xffFFB239),
            hindText: 'Email',
          ),
          SizedBox(
            height: 20,
          ),
          TextfieldWidget(
            ancho: width - 70,
            iconoIzquida: true,
            icono: Icons.vpn_key_sharp,
            colorFondo: Color(0xffDE596C),
            hindText: 'Password',
          ),
        ],
      ),
    );
  }
}
