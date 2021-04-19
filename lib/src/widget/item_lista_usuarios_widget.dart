import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:control_usuarios/src/pages/ficha_page.dart';
import 'package:control_usuarios/src/widget/circulo_widget.dart';
import 'package:control_usuarios/src/widget/trancicion_cambio_pagina_animation.dart';
import 'package:control_usuarios/src/utils/size_scream_util.dart';

class ItemListaUsuariosWidget extends StatelessWidget {
  final String apyNom;
  final String direccion;
  final bool sincronizado;
  final String fotoUrl;
  final String tagHero;

  const ItemListaUsuariosWidget({
    @required this.apyNom,
    @required this.direccion,
    @required this.sincronizado,
    this.fotoUrl,
    @required this.tagHero,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final maxHeight = sizeScreemUtil(
        sizeActual: size.height * 22 / 100, sizeMin: 80, sizeMax: 160);
    return GestureDetector(
      onTap: () =>
          Navigator.push(context, trancicionCambioPaginaAnimation(FichaPage())),
      child: Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          height: maxHeight,
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                _FotoUsuario(
                  fotoUrl: this.fotoUrl,
                  tagHero: this.tagHero,
                  width: sizeScreemUtil(
                      sizeActual: size.height * 16 / 100,
                      sizeMin: 50,
                      sizeMax: 110),
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: _InformacionUsuario(
                    apyNom: this.apyNom,
                    direccion: this.direccion,
                  ),
                ),
                _IconosDerecha(
                  sincronizado: this.sincronizado,
                  sizeContenedor: maxHeight,
                )
              ],
            ),
          )),
    );
  }
}

class _IconosDerecha extends StatelessWidget {
  final bool sincronizado;
  final double sizeContenedor;

  const _IconosDerecha({this.sincronizado, this.sizeContenedor});
  @override
  Widget build(BuildContext context) {
    return Container(
        height: this.sizeContenedor,
        child: Column(
          children: [
            FaIcon(
              this.sincronizado ? Icons.cloud_done_outlined : Icons.cloud_off,
              color: this.sincronizado ? Colors.greenAccent : Colors.redAccent,
              size: sizeScreemUtil(
                  sizeActual: sizeContenedor * 25 / 100,
                  sizeMin: 1,
                  sizeMax: 30),
            ),
            Spacer(),
            FaIcon(
              Icons.chevron_right_outlined,
              size: sizeScreemUtil(
                  sizeActual: sizeContenedor * 25 / 100,
                  sizeMin: 1,
                  sizeMax: 40),
              color: Colors.grey,
            ),
          ],
        ));
  }
}

class _FotoUsuario extends StatelessWidget {
  final String fotoUrl;

  final String tagHero;
  final double width;
  const _FotoUsuario({this.fotoUrl, this.tagHero, this.width});
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        width: width,
        child: Hero(
          tag: this.tagHero,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(400),
              child: CirculoWidget(
                sizeCirculo: width,
                colorCiculo: Colors.white,
                contenidoCirculo: Image(
                  image: AssetImage(this.fotoUrl),
                  fit: BoxFit.cover,
                ),
              )),
        ));
  }
}

class _InformacionUsuario extends StatelessWidget {
  final String apyNom;
  final String direccion;

  const _InformacionUsuario({this.apyNom, this.direccion});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Spacer(),
          Text(
            apyNom,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(
                fontSize: sizeScreemUtil(
                    sizeActual: size.height * 3 / 100,
                    sizeMin: 12,
                    sizeMax: 21),
                fontWeight: FontWeight.bold),
          ),
          Text(
            direccion,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(
              fontSize: sizeScreemUtil(
                  sizeActual: size.height * 3 / 100, sizeMin: 12, sizeMax: 21),
              color: Colors.grey,
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
