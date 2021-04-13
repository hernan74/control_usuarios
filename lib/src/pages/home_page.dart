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
              top: size.height * 5 / 100, right: 0, child: _IconoAppBar()),
          Positioned(
              top: size.height * 7 / 100,
              child: _Titulo(
                cantRegistros: listaUsuarios.length,
              )),
          Positioned(
            top: size.height * 19 / 100,
            child: Container(
              width: size.width,
              height: size.height * 82 / 100,
              child: _ListaUsuarios(),
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
                  fontSize: 26,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: size.height * 1 / 100,
            ),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                text: 'Nro. Usuarios: ',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.white,
                ),
              ),
              TextSpan(
                text: '$cantRegistros',
                style: TextStyle(
                    fontSize: 13,
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
  const _ListaUsuarios({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Scrollbar(
          child: Padding(
            padding: const EdgeInsets.only(right: 15),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: listaUsuarios.map(
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
            ),
          ),
        ),
      ),
    );
  }
}

class _BotonFlotante extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Hero(
      tag: 'GuardarNuevo',
      child: ButtonWidget(
        ancho: size.width * 17 / 100,
        alto: size.width * 17 / 100,
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
