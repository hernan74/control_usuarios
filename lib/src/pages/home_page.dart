import 'package:control_usuarios/src/widget/fondo_widget.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:control_usuarios/src/pages/ficha_page_mod2.dart';
import 'package:control_usuarios/src/widget/item_lista_usuarios_widget.dart';
import 'package:control_usuarios/src/widget/trancicion_cambio_pagina_animation.dart';
import 'package:control_usuarios/src/widget/button_widget.dart';
import 'package:control_usuarios/src/helpers/estilos.dart' as estilo;

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          FondoWidget(),
          Positioned(
              top: size.height * 3 / 100,
              right: 0,
              child: _IconoCerrarSesion()),
          Positioned(
            top: size.height * 8 / 100,
            child: Container(
              width: size.width,
              height: size.height * 90 / 100,
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  _ListaUsuarios(),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: _BotonFlotante(),
    );
  }
}

class _IconoCerrarSesion extends StatelessWidget {
  const _IconoCerrarSesion({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.logout),
      color: estilo.colorIconos,
      iconSize: 30,
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}

class _ListaUsuarios extends StatelessWidget {
  const _ListaUsuarios({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ItemListaUsuariosWidget(
          tagHero: 'hernan',
          fotoUrl: 'assets/avatar.png',
          apyNom: 'Hernan Daniel Lopez',
          direccion: 'Km 10, Eldorado, Misiones',
          sincronizado: true,
        ),
        ItemListaUsuariosWidget(
          tagHero: 'juanito',
          fotoUrl: 'assets/avatar.jpg',
          apyNom: 'Juanito Perez',
          direccion: 'km 6, Eldorado, Misiones',
          sincronizado: false,
        ),
        ItemListaUsuariosWidget(
          tagHero: 'maria',
          fotoUrl: 'assets/avatar.png',
          apyNom: 'Maria Martinez',
          direccion: 'km 11, Eldorado, Misiones',
          sincronizado: false,
        ),
        ItemListaUsuariosWidget(
          tagHero: 'hernan1',
          fotoUrl: 'assets/avatar.png',
          apyNom: 'Hernan Daniel Lopez',
          direccion: 'Km 10, Eldorado, Misiones',
          sincronizado: true,
        ),
        ItemListaUsuariosWidget(
          tagHero: 'juanito1',
          fotoUrl: 'assets/avatar.jpg',
          apyNom: 'Juanito Perez',
          direccion: 'km 6, Eldorado, Misiones',
          sincronizado: false,
        ),
        ItemListaUsuariosWidget(
          tagHero: 'maria1',
          fotoUrl: 'assets/avatar.png',
          apyNom: 'Maria Martinez',
          direccion: 'km 11, Eldorado, Misiones',
          sincronizado: false,
        ),
        ItemListaUsuariosWidget(
          tagHero: 'hernan2',
          fotoUrl: 'assets/avatar.png',
          apyNom: 'Hernan Daniel Lopez',
          direccion: 'Km 10, Eldorado, Misiones',
          sincronizado: true,
        ),
        ItemListaUsuariosWidget(
          tagHero: 'juanito2',
          fotoUrl: 'assets/avatar.jpg',
          apyNom: 'Juanito Perez',
          direccion: 'km 6, Eldorado, Misiones',
          sincronizado: false,
        ),
        ItemListaUsuariosWidget(
          tagHero: 'maria2',
          fotoUrl: 'assets/avatar.png',
          apyNom: 'Maria Martinez',
          direccion: 'km 11, Eldorado, Misiones',
          sincronizado: false,
        ),
        ItemListaUsuariosWidget(
          tagHero: 'hernan3',
          fotoUrl: 'assets/avatar.png',
          apyNom: 'Hernan Daniel Lopez',
          direccion: 'Km 10, Eldorado, Misiones',
          sincronizado: true,
        ),
        ItemListaUsuariosWidget(
          tagHero: 'juanito3',
          fotoUrl: 'assets/avatar.jpg',
          apyNom: 'Juanito Perez',
          direccion: 'km 6, Eldorado, Misiones',
          sincronizado: false,
        ),
        ItemListaUsuariosWidget(
          tagHero: 'maria3',
          fotoUrl: 'assets/avatar.png',
          apyNom: 'Maria Martinez',
          direccion: 'km 11, Eldorado, Misiones',
          sincronizado: false,
        ),
      ],
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
