import 'package:flutter/material.dart';

import 'package:control_usuarios/src/helpers/import_helpers.dart';

import 'package:control_usuarios/src/helpers/estilos.dart' as estilo;

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
              FondoLoginWidget(),
              _Cabecera(),
              Positioned(
                  left: size.width * 4 / 100,
                  top: size.height * 5 / 100,
                  child: _CerrarVentana()),
              Positioned(top: size.height * 25 / 100, child: _Formulario())
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
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          top: size.height * 5 / 100,
          child: Hero(
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
      height: size.height * 74 / 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _TituloFormulario(
            size: size,
          ),
          SizedBox(
            height: 10,
          ),
          _CamposFormulario(size: size),
          _BotonGuardarFormulario(size: size),
        ],
      ),
    );
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
      height: size.height * 56 / 100,
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            Column(
              children: modeloficha
                  .map((modelo) => Column(
                        children: [
                          if (modelo.tipoDato != 'date')
                            TextfieldWidget(
                                iconoIzquida: (modelo.indice % 2 != 0),
                                alineacionTexto: TextAlign.start,
                                ancho: size.width * 85 / 100,
                                hindText: modelo.titulo,
                                icono: modelo.icono,
                                colorGradienteIconoInicio:
                                    (modelo.indice % 2 != 0)
                                        ? estilo.colorPrimarioDos
                                        : estilo.colorPrimarioUno,
                                colorGradienteIconoFin: (modelo.indice % 2 != 0)
                                    ? estilo.colorPrimarioDosGradiente
                                    : estilo.colorPrimarioUnoGradiente,
                                textInputType: (modelo.tipoDato == 'String')
                                    ? TextInputType.text
                                    : TextInputType.number)
                          else
                            SelectorFechaWidget(
                              colorGradienteIconoInicio:
                                  (modelo.indice % 2 != 0)
                                      ? estilo.colorPrimarioDos
                                      : estilo.colorPrimarioUno,
                              colorGradienteIconoFin: (modelo.indice % 2 != 0)
                                  ? estilo.colorPrimarioDosGradiente
                                  : estilo.colorPrimarioUnoGradiente,
                              iconoIzquida: modelo.indice % 2 != 0,
                              ancho: size.width * 85 / 100,
                              hindText: modelo.titulo,
                              icono: modelo.icono,
                            ),
                          SizedBox(
                            height: size.width * 5 / 100,
                          ),
                        ],
                      ))
                  .toList(),
            ),
            SwichListTile(
              checkColor: estilo.colorPrimarioDos,
              fondoCheckColor: estilo.colorPrimarioUno,
              ancho: size.width * 80 / 100,
              titulo: 'Es pensionado',
            ),
            SizedBox(
              height: size.width * 5 / 100,
            ),
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
            ancho: size.width * 80 / 100,
            alto: 50,
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
    return OpacityAnimation(
      duration: Duration(seconds: 2),
      child: Container(
        child: Column(
          children: [
            Text(
              'Formulario',
              textAlign: TextAlign.right,
              style: TextStyle(
                  fontSize: estilo.sizeTituloLogin,
                  color: estilo.colorTituloLogin),
            ),
          ],
        ),
      ),
    );
  }
}
