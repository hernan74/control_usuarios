import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:control_usuarios/src/helpers/import_helpers.dart';

import 'package:control_usuarios/src/pages/ficha_page_mod2.dart';
import 'package:control_usuarios/src/helpers/estilos.dart' as estilo;

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          FondoHomeWidget(),
          Positioned(
              top: sizeScreemUtil(
                  sizeActual: size.height * 5 / 100, sizeMin: 0, sizeMax: 40),
              right: size.width * 2 / 100,
              child: _IconoAppBar()),
          Positioned(
              top: sizeScreemUtil(
                  sizeActual: size.height * 7 / 100, sizeMin: 0, sizeMax: 54),
              child: _Titulo(
                cantRegistros: listaUsuarios.length,
              )),
          Positioned(
            top: size.height * 19 / 100,
            child: Container(
              width: size.width,
              height: size.height * 82 / 100,
              child: _ListaUsuarios(
                widthActual: size.width * 90 / 100,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: _BotonFlotante(),
    );
  }
}

class _Titulo extends StatelessWidget {
  final int cantRegistros;

  const _Titulo({this.cantRegistros});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      children: [
        Column(
          children: [
            Text(
              'Usuarios',
              textAlign: TextAlign.right,
              style: TextStyle(
                  fontSize: sizeScreemUtil(
                      sizeActual: size.height * 5 / 100,
                      sizeMin: 14,
                      sizeMax: 26),
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                text: 'Nro. Usuarios: ',
                style: TextStyle(
                  fontSize: sizeScreemUtil(
                      sizeActual: size.height * 2 / 100,
                      sizeMin: 8,
                      sizeMax: 13),
                  color: Colors.white,
                ),
              ),
              TextSpan(
                text: '$cantRegistros',
                style: TextStyle(
                    fontSize: sizeScreemUtil(
                        sizeActual: size.height * 2 / 100,
                        sizeMin: 8,
                        sizeMax: 13),
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ]))
          ],
        ),
      ],
    );
  }
}

class _IconoAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.search),
          color: estilo.colorIconos,
          iconSize: 30,
          onPressed: () {
            showSearch(context: context, delegate: DataSearch());
          },
        ),
        IconButton(
          icon: Icon(Icons.logout),
          color: estilo.colorIconos,
          iconSize: 30,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}

class _ListaUsuarios extends StatelessWidget {
  final double widthActual;

  const _ListaUsuarios({this.widthActual});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size * 90 / 100;
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: Scrollbar(
        child: Padding(
            padding: const EdgeInsets.only(right: 15, left: 15),
            child: GridViewWidget(
              maxHeightItem: sizeScreemUtil(
                  sizeActual: size.height * 22 / 100,
                  sizeMin: 80,
                  sizeMax: 130),
              widthItem: sizeScreemUtil(
                  sizeActual: size.width * 90 / 100,
                  sizeMin: 150,
                  sizeMax: 350),
              maxWidth: this.widthActual,
              listaElementos: listaUsuarios.map(
                (usu) {
                  final key = UniqueKey();
                  return Dismissible(
                    key: key,
                    child: ItemListaUsuariosWidget(
                      tagHero: usu.uniqueId,
                      fotoUrl: usu.fotoUrl,
                      apyNom: usu.apyNom,
                      direccion: usu.direccion,
                      sincronizado: usu.sincronizado,
                    ),
                  );
                },
              ).toList(),
            )),
      ),
    );
  }
}

class _BotonFlotante extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = sizeScreemUtil(
        sizeActual: MediaQuery.of(context).size.height * 17 / 100,
        sizeMin: 40,
        sizeMax: 80);
    return Hero(
      tag: 'GuardarNuevo',
      child: ButtonWidget(
        ancho: size,
        alto: size,
        colorGradienteInicio: estilo.colorPrimarioUno,
        colorGradienteFinal: estilo.colorPrimarioDos,
        widget: FaIcon(
          FontAwesomeIcons.user,
        ),
        onPressed: () {
          Navigator.push(
              context, trancicionCambioPaginaAnimation(FichaPageMod()));
        },
      ),
    );
  }
}
