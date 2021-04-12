import 'package:control_usuarios/src/helpers/usuarios.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:control_usuarios/src/pages/ficha_page_mod2.dart';
import 'package:control_usuarios/src/widget/item_lista_usuarios_widget.dart';
import 'package:control_usuarios/src/widget/trancicion_cambio_pagina_animation.dart';
import 'package:control_usuarios/src/widget/button_widget.dart';
import 'package:control_usuarios/src/helpers/estilos.dart' as estilo;
import 'package:control_usuarios/src/search/search_delegate.dart';
import 'package:control_usuarios/src/widget/fondo_home_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          FondoHomeWidget(),
          Positioned(
              top: size.height * 5 / 100, right: 0, child: _IconoAppBar()),
          Positioned(
            top: size.height * 12 / 100,
            child: Container(
              width: size.width,
              height: size.height * 90 / 100,
              child: _ListaUsuarios(),
            ),
          ),
        ],
      ),
      floatingActionButton: _BotonFlotante(),
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
        padding: const EdgeInsets.symmetric(horizontal: 20),
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
