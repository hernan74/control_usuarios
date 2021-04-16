import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:control_usuarios/src/helpers/import_helpers.dart';

import 'package:control_usuarios/src/helpers/estilos.dart' as estilo;

class HistorialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            FondoLoginWidget(),
            Positioned(
                left: size.width * 4 / 100,
                top: size.height * 5 / 100,
                child: _AppBar()),
            Positioned(
              top: size.height * 10 / 100,
              child: _Body(),
            )
          ],
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _Formulario(),
          SizedBox(
            height: size.height * 3 / 100,
          ),
          _ListaHistorial(
              listaHistorial: listaHistorialMotivo
                  .map((model) => ItemListaHistorial(
                      fecha: model.fecha,
                      motivo: model.motivo,
                      sincronizado: model.sincronizado))
                  .toList())
        ],
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 90 / 100,
      height: size.height * 7 / 100,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: 0,
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: sizeScreemUtil(
                    sizeActual: size.height * 5 / 100,
                    sizeMin: 10,
                    sizeMax: 40),
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          Positioned(
            top: size.height * 3 / 100,
            child: Text(
              'Nuevo Motivo',
              style: TextStyle(
                  fontSize: sizeScreemUtil(
                      sizeActual: size.height * 3 / 100,
                      sizeMin: 10,
                      sizeMax: 22),
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}

class _Formulario extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 90 / 100,
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            height: size.height * 3 / 100,
          ),
          SelectorFechaWidget(
            colorGradienteIconoInicio: estilo.colorPrimarioUno,
            colorGradienteIconoFin: estilo.colorPrimarioUnoGradiente,
            alto: sizeScreemUtil(
                sizeActual: size.height * 9 / 100, sizeMin: 40, sizeMax: 60),
            hindText: 'Fecha',
            hintTextSize: sizeScreemUtil(
                sizeActual: size.height * 3 / 100, sizeMin: 22, sizeMax: 25),
            icono: FontAwesomeIcons.calendarAlt,
          ),
          DropdownWidget(
            ancho: size.width * 90 / 100,
            hintTextSize: sizeScreemUtil(
                sizeActual: size.height * 3 / 100, sizeMin: 22, sizeMax: 25),
            alto: sizeScreemUtil(
                sizeActual: size.height * 9 / 100, sizeMin: 40, sizeMax: 60),
            titulo: 'Motivos',
            items: [
              ItemExpancionPanelModel(
                titulo: 'Primer valor',
                valor: 'Primero',
              ),
              ItemExpancionPanelModel(
                titulo: 'Segundo valor',
                valor: 'Segundo',
              ),
              ItemExpancionPanelModel(
                titulo: 'Tercer valor',
                valor: 'Tercero',
              ),
            ],
          ),
          _BotonGuardarFormulario()
        ],
      ),
    );
  }
}

class _BotonGuardarFormulario extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(top: size.height * 0.02),
      alignment: Alignment.centerRight,
      child: Hero(
        tag: 'GuardarNuevo',
        child: ButtonWidget(
          widget: Text('Agregar',
              style: TextStyle(
                  color: estilo.colorTextoBoton,
                  fontWeight: FontWeight.bold,
                  fontSize: estilo.sizeText)),
          ancho: sizeScreemUtil(
              sizeActual: size.width * 35 / 100, sizeMin: 90, sizeMax: 200),
          alto: sizeScreemUtil(
              sizeActual: size.height * 6 / 100, sizeMin: 30, sizeMax: 45),
          utilizaGradiente: true,
          colorGradienteInicio: estilo.colorPrimarioDos,
          colorGradienteFinal: estilo.colorPrimarioUno,
          onPressed: () {},
        ),
      ),
    );
  }
}

class _ListaHistorial extends StatelessWidget {
  final List<ItemListaHistorial> listaHistorial;

  const _ListaHistorial({Key key, this.listaHistorial}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        width: size.width * 90 / 100,
        height: size.height * 55 / 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: _CabeceraListaHistorial(
                cantRegistros: listaHistorial.length,
              ),
            ),
            SizedBox(
              height: size.height * 3 / 100,
            ),
            Expanded(
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: Scrollbar(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: GridViewWidget(
                      maxHeightItem: sizeScreemUtil(
                          sizeActual: size.height * 15 / 100,
                          sizeMin: 90,
                          sizeMax: 200),
                      widthItem: sizeScreemUtil(
                          sizeActual: size.width * 90 / 100,
                          sizeMin: 100,
                          sizeMax: 350),
                      widthActual: size.width * 90 / 100,
                      listaElementos: listaHistorial,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

class _CabeceraListaHistorial extends StatelessWidget {
  final int cantRegistros;

  const _CabeceraListaHistorial({@required this.cantRegistros});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Hero(
          tag: 'TextHistorial',
          flightShuttleBuilder: (flightContext, animation, flightDirection,
                  fromHeroContext, toHeroContext) =>
              FlightShuttleBuilderWidget(flightContext, animation,
                  flightDirection, fromHeroContext, toHeroContext),
          child: Text(
            'Historial',
            textAlign: TextAlign.right,
            style: TextStyle(
                fontSize: sizeScreemUtil(
                    sizeActual: size.height * 3.5 / 100,
                    sizeMin: 18,
                    sizeMax: 30),
                color: estilo.colorTituloLogin,
                fontWeight: FontWeight.bold),
          ),
        ),
        RichText(
            text: TextSpan(children: [
          TextSpan(
            text: 'Cant. de registros: ',
            style: TextStyle(
              fontSize: sizeScreemUtil(
                  sizeActual: size.height * 2 / 100, sizeMin: 10, sizeMax: 30),
              color: estilo.colorTituloLogin,
            ),
          ),
          TextSpan(
            text: '$cantRegistros',
            style: TextStyle(
                fontSize: sizeScreemUtil(
                    sizeActual: size.height * 2 / 100,
                    sizeMin: 10,
                    sizeMax: 30),
                color: estilo.colorTituloLogin,
                fontWeight: FontWeight.bold),
          ),
        ]))
      ],
    );
  }
}
