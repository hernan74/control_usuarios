import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:control_usuarios/src/helpers/estilos.dart' as estilo;
import 'package:control_usuarios/src/pages/historial_page.dart';
import 'package:control_usuarios/src/helpers/import_helpers.dart';

class FichaPageMod extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height,
          child: Stack(
            alignment: Alignment.center,
            children: [
              FondoFormularioWidget(),
              Positioned(top: size.height * 5 / 100, child: _Cabecera()),
              Positioned(
                  left: size.width * 4 / 100,
                  top: size.height * 5 / 100,
                  child: _CerrarVentana()),
              Positioned(
                left: size.width * 7 / 100,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    _TituloFormulario(
                      size: size,
                    ),
                    _Formulario()
                  ],
                ),
              ),
              Positioned(
                bottom: 57,
                child: _AdjuntarImagen(),
              ),
              Positioned(
                bottom: 10,
                child: _BotonGuardarFormulario(size: size),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _CerrarVentana extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back,
        color: Colors.white,
        size: 40,
      ),
      onPressed: () => Navigator.pop(context),
    );
  }
}

class _Cabecera extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Hero(
            tag: 'juanito',
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: CirculoWidget(
                sizeCirculo: size.height * 18 / 100,
                colorCiculo: Colors.white,
                contenidoCirculo: Image(
                  image: AssetImage('assets/avatar.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -5,
            right: -10,
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
            ),
          )
        ],
      ),
    );
  }
}

class _Formulario extends StatelessWidget {
  const _Formulario({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return _CamposFormulario(size: size);
  }
}

class _CamposFormulario extends StatelessWidget {
  const _CamposFormulario({
    @required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 90 / 100,
      height: size.height * 38 / 100,
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Scrollbar(
          child: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GridViewWidget(
              widthActual: size.width * 90 / 100,
              widthItem: sizeScreemUtil(
                  sizeActual: size.width * 84 / 100,
                  sizeMin: 350,
                  sizeMax: 600),
              maxHeightItem: size.height * 9 / 100,
              listaElementos: modeloficha.map((modelo) {
                if (modelo.tipoDato == 'String' || modelo.tipoDato == 'number')
                  return TextfieldWidget(
                      alineacionTexto: TextAlign.start,
                      hindText: modelo.titulo,
                      icono: modelo.icono,
                      colorGradienteIconoInicio: estilo.colorPrimarioUno,
                      colorGradienteIconoFin: estilo.colorPrimarioUnoGradiente,
                      textInputType: (modelo.tipoDato == 'String')
                          ? TextInputType.text
                          : TextInputType.number);
                else if (modelo.tipoDato == 'date')
                  return SelectorFechaWidget(
                    colorGradienteIconoInicio: estilo.colorPrimarioUno,
                    colorGradienteIconoFin: estilo.colorPrimarioUnoGradiente,
                    hindText: modelo.titulo,
                    icono: modelo.icono,
                  );
                else
                  return SwichListTile(
                    checkColor: estilo.colorPrimarioDos,
                    fondoCheckColor: estilo.colorPrimarioUno,
                    ancho: sizeScreemUtil(
                        sizeActual: size.width * 88 / 100,
                        sizeMin: 360,
                        sizeMax: 610),
                    titulo: modelo.titulo,
                  );
              }).toList(),
            ),
          ),
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
        SizedBox(
          height: size.height * 3 / 100,
        ),
        Hero(
          tag: 'GuardarNuevo',
          child: ButtonWidget(
            widget: Text('Guadar',
                style: TextStyle(
                    color: estilo.colorTextoBoton,
                    fontWeight: FontWeight.bold,
                    fontSize: estilo.sizeText)),
            ancho: size.width * 60 / 100,
            alto: size.height * 7 / 100,
            utilizaGradiente: true,
            colorGradienteInicio: estilo.colorPrimarioDos,
            colorGradienteFinal: estilo.colorPrimarioUno,
            onPressed: () {
              mostrarSnackBar(context: context, msj: 'Mensaje SnackBar');
            },
          ),
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
    final size = MediaQuery.of(context).size;
    return OpacityAnimation(
      duration: Duration(seconds: 2),
      child: Container(
        width: size.width * 90 / 100,
        height: size.height * 12 / 100,
        padding: const EdgeInsets.only(right: (20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FaIcon(
                    FontAwesomeIcons.history,
                    color: Colors.pink,
                    size: size.height * 3 / 100,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Hero(
                    tag: 'TextHistorial',
                    flightShuttleBuilder: (flightContext, animation,
                            flightDirection, fromHeroContext, toHeroContext) =>
                        FlightShuttleBuilderWidget(flightContext, animation,
                            flightDirection, fromHeroContext, toHeroContext),
                    child: Text(
                      'Historial ',
                      style: TextStyle(
                          fontSize: size.height * 3.5 / 100,
                          color: estilo.colorTituloLogin,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              onTap: () {
                Navigator.push(
                    context, trancicionCambioPaginaAnimation(HistorialPage()));
              },
            ),
            Text(
              'Formulario',
              textAlign: TextAlign.right,
              style: TextStyle(
                  fontSize: size.height * 4.5 / 100,
                  color: estilo.colorTituloLogin),
            ),
          ],
        ),
      ),
    );
  }
}

class _AdjuntarImagen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 14 / 100,
      width: size.width * 90 / 100,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Spacer(),
          ListViewHorizontalWidget(
            maxWidth: size.width * 84 / 100,
            maxHeight: size.height * 13 / 100,
          ),
        ],
      ),
    );
  }
}
