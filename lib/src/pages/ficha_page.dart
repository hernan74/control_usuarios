import 'package:flutter/material.dart';

import 'package:control_usuarios/src/widget/checkbox_widget.dart';
import 'package:control_usuarios/src/widget/expancion_panel_widget.dart';
import 'package:control_usuarios/src/widget/linea_color_widget.dart';
import 'package:control_usuarios/src/widget/textfield_widget.dart';
import 'package:control_usuarios/src/widget/button_widget.dart';
import 'package:control_usuarios/src/widget/circulo_widget.dart';
import 'package:control_usuarios/src/helpers/estilos.dart' as estilo;
import 'package:control_usuarios/src/helpers/modelo_ficha.dart';
import 'package:control_usuarios/src/widget/fondo_widget.dart';

class FichaPage extends StatelessWidget {
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
              _Cabecera(),
              Positioned(top: size.height * 25 / 100, child: _Formulario())
            ],
          ),
        ),
      ),
    );
  }
}

class _Cabecera extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          top: size.height * 5 / 100,
          child: CirculoWidget(
            sizeCirculo: size.height * 18 / 100,
            colorCiculo: estilo.colorPrimarioUno,
            contenidoCirculo: ClipRRect(
              child: Image(image: AssetImage('assets/avatar.png')),
            ),
          ),
        ),
        Positioned(
            top: size.height * 18 / 100,
            right: size.width * 30 / 100,
            child: ButtonWidget(
              alto: size.height * 4.5 / 100,
              ancho: size.height * 4.5 / 100,
              colorGradienteInicio: estilo.colorPrimarioDos,
              colorGradienteFinal: estilo.colorPrimarioUno,
              widget: Icon(
                Icons.camera_alt_outlined,
                color: Colors.white,
                size: size.height * 3.5 / 100,
              ),
              onPressed: () {},
            ))
      ],
    );
  }
}

class _Formulario extends StatelessWidget {
  const _Formulario({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 90 / 100,
      height: size.height * 73 / 100,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            _TituloFormulario(
              size: size,
            ),
            Container(
              width: size.width * 90 / 100,
              height: size.height * 56 / 100,
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: <Widget>[
                  Column(
                    children: modeloficha
                        .map((modelo) => Column(
                              children: [
                                TextfieldWidget(
                                  ancho: size.width * 85 / 100,
                                  hindText: modelo.titulo,
                                  icono: modelo.icono,
                                  colorGradienteIconoInicio:
                                      estilo.colorPrimarioUno,
                                  colorGradienteIconoFin:
                                      estilo.colorPrimarioUnoGradiente,
                                ),
                                SizedBox(
                                  height: size.width * 5 / 100,
                                ),
                              ],
                            ))
                        .toList(),
                  ),
                  CheckBoxWidget(
                    checkColor: estilo.colorPrimarioDos,
                    fondoCheckColor: estilo.colorPrimarioUno,
                    ancho: size.width * 80 / 100,
                    titulo: 'Es pensionado',
                    onChanged: (valor) {},
                  ),
                  SizedBox(
                    height: size.width * 5 / 100,
                  ),
                  ExpancionPanelWidget(
                    contenido: null,
                  ),
                  SizedBox(
                    height: size.width * 5 / 100,
                  ),
                ],
              ),
            ),
            _BotonGuardarFormulario(size: size),
          ],
        ),
      ),
    );
  }
}

class _BotonGuardarFormulario extends StatelessWidget {
  const _BotonGuardarFormulario({
    @required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LineaColorWidget(
          ancho: size.height * 90 / 100,
          offsetSombra: -2,
        ),
        SizedBox(
          height: size.width * 2 / 100,
        ),
        ButtonWidget(
          widget: Text('Guadar',
              style: TextStyle(
                  color: estilo.colorTextoBoton,
                  fontWeight: FontWeight.bold,
                  fontSize: estilo.sizeText)),
          ancho: size.width - 60,
          alto: 50,
          utilizaGradiente: true,
          colorGradienteInicio: estilo.colorPrimarioDos,
          colorGradienteFinal: estilo.colorPrimarioUno,
        ),
        SizedBox(
          height: size.width * 2 / 100,
        ),
      ],
    );
  }
}

class _TituloFormulario extends StatelessWidget {
  const _TituloFormulario({
    @required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: size.width * 2 / 100,
        ),
        Text(
          'Formulario',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: estilo.sizeTituloLogin, color: estilo.colorTituloLogin),
        ),
        SizedBox(
          height: size.width * 2 / 100,
        ),
        LineaColorWidget(
          offsetSombra: 2,
          ancho: size.height * 90 / 100,
        ),
      ],
    );
  }
}
