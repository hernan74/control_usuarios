import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:control_usuarios/src/pages/ficha_page.dart';
import 'package:control_usuarios/src/widget/circulo_widget.dart';
import 'package:control_usuarios/src/widget/trancicion_cambio_pagina_animation.dart';
import 'package:control_usuarios/src/helpers/estilos.dart' as estilo;

class ItemListaUsuariosWidget extends StatelessWidget {
  final String apyNom;
  final String direccion;
  final bool sincronizado;
  final String fotoUrl;
  final String tagHero;

  const ItemListaUsuariosWidget(
      {@required this.apyNom,
      @required this.direccion,
      @required this.sincronizado,
      this.fotoUrl,
      @required this.tagHero});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () =>
          Navigator.push(context, trancicionCambioPaginaAnimation(FichaPage())),
      child: Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          width: size.width * 90 / 100,
          height: size.height * 14 / 100,
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _FotoUsuario(
                  fotoUrl: this.fotoUrl,
                  tagHero: this.tagHero,
                ),
                SizedBox(
                  width: 5,
                ),
                _InformacionUsuario(
                  apyNom: this.apyNom,
                  direccion: this.direccion,
                ),
                _IconosDerecha(
                  sincronizado: this.sincronizado,
                )
              ],
            ),
          )),
    );
  }
}

class _IconosDerecha extends StatelessWidget {
  final bool sincronizado;

  const _IconosDerecha({this.sincronizado});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        width: size.width * 7 / 100,
        height: size.height * 14 / 100,
        child: Column(
          children: [
            FaIcon(
              this.sincronizado ? Icons.cloud_done_outlined : Icons.cloud_off,
              color: this.sincronizado ? Colors.greenAccent : Colors.redAccent,
              size: size.width * 6 / 100,
            ),
            Spacer(),
            FaIcon(
              Icons.chevron_right_outlined,
              size: size.width * 7 / 100,
              color: Colors.grey,
            ),
          ],
        ));
  }
}

class _FotoUsuario extends StatelessWidget {
  final String fotoUrl;

  final String tagHero;

  const _FotoUsuario({this.fotoUrl, this.tagHero});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        width: size.width * 23 / 100,
        height: size.width * 23 / 100,
        alignment: Alignment.center,
        child: Hero(
          tag: this.tagHero,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: CirculoWidget(
                sizeCirculo: size.height * 17 / 100,
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
    return Container(
      width: MediaQuery.of(context).size.width * 54 / 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Spacer(),
          Text(
            apyNom,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(
                fontSize: estilo.sizeText, fontWeight: FontWeight.bold),
          ),
          Text(
            direccion,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(
              fontSize: estilo.sizeHindTextfield,
              color: Colors.grey,
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
