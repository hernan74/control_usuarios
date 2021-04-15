import 'dart:io';
import 'package:control_usuarios/src/utils/size_scream_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

import 'package:control_usuarios/src/helpers/estilos.dart' as estilo;

class ListViewHorizontalWidget extends StatefulWidget {
  final double maxWidth;
  final double maxHeight;

  const ListViewHorizontalWidget(
      {@required this.maxWidth, @required this.maxHeight});
  @override
  _ListViewHorizontalWidgetState createState() =>
      _ListViewHorizontalWidgetState();
}

class _ListViewHorizontalWidgetState extends State<ListViewHorizontalWidget> {
  final _pageController = PageController(
    initialPage: 0,
    viewportFraction: 0.2,
  );
  List<Image> listaElementos = [];
  double widthActual = 0;
  @override
  Widget build(BuildContext context) {
    widthActual =
        (widthActual == 0) ? this.widget.maxWidth * 20 / 100 : widthActual;

    return Container(
      height: this.widget.maxHeight,
      width: sizeScreemUtil(
          sizeActual: widthActual,
          sizeMin: this.widget.maxWidth * 15 / 100,
          sizeMax: this.widget.maxWidth),
      child: MediaQuery.removePadding(
        context: context,
        removeLeft: true,
        removeRight: true,
        child: Scrollbar(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              controller: this._pageController,
              itemCount: this.listaElementos.length + 1,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, i) {
                return (i < this.listaElementos.length)
                    ? _ItemLista(
                        image: this.listaElementos[i],
                      )
                    : Container(
                        width: sizeScreemUtil(
                            sizeActual: this.widget.maxWidth * 20 / 100,
                            sizeMin: 40,
                            sizeMax: 130),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                width: 3, color: estilo.colorPrimarioUno)),
                        child: IconButton(
                          icon: FaIcon(
                            FontAwesomeIcons.plusSquare,
                            size: widget.maxHeight * 40 / 100,
                            color: estilo.colorPrimarioUnoGradiente,
                          ),
                          onPressed: () {
                            _procesarImagen(ImageSource.gallery);
                          },
                        ),
                      );
              },
            ),
          ),
        ),
      ),
    );
  }

  void _procesarImagen(ImageSource origin) async {
    final _picker = ImagePicker();

    final pickedFile = await _picker.getImage(
      source: origin,
    );
    if (pickedFile == null) return;

    Image nuevaImagen;
    if (kIsWeb) {
      PickedFile aux = new PickedFile(pickedFile.path);
      nuevaImagen = Image.network(aux.path);
    } else {
      File foto = File(pickedFile.path);

      nuevaImagen = Image.file(foto);
    }
    this.listaElementos.add(nuevaImagen);
    this.widthActual = this.widthActual + 100;
    setState(() {});
  }
}

class _ItemLista extends StatelessWidget {
  final Image image;

  const _ItemLista({this.image});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: ClipRRect(borderRadius: BorderRadius.circular(10), child: image),
    );
  }
}
