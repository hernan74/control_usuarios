import 'dart:io';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

import 'package:control_usuarios/src/helpers/estilos.dart';

class ListViewHorizontalWidget extends StatefulWidget {
  @override
  _ListViewHorizontalWidgetState createState() =>
      _ListViewHorizontalWidgetState();
}

class _ListViewHorizontalWidgetState extends State<ListViewHorizontalWidget> {
  final _pageController = PageController(
    initialPage: 0,
    viewportFraction: 0.5,
  );
  List<ItemListaModel> listaElementos = [];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 25 / 100,
      child: MediaQuery.removePadding(
        context: context,
        child: Scrollbar(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: PageView.builder(
              physics: BouncingScrollPhysics(),
              pageSnapping: false,
              controller: _pageController,
              itemCount: listaElementos.length + 1,
              itemBuilder: (context, i) {
                return (i < listaElementos.length)
                    ? _ItemLista(
                        item: listaElementos[i],
                        ultimoElemento: (i == listaElementos.length - 1))
                    : Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border:
                                Border.all(width: 3, color: colorPrimarioUno)),
                        child: IconButton(
                          icon: FaIcon(
                            FontAwesomeIcons.plusSquare,
                            size: size.height * 13 / 100,
                            color: colorPrimarioUnoGradiente,
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

    File foto = File(pickedFile.path);

    if (foto != null) {
      listaElementos.add(new ItemListaModel(urlFoto: foto.path, nuevo: true));
      setState(() {});
    }
  }
}

class _ItemLista extends StatelessWidget {
  final ItemListaModel item;

  final bool ultimoElemento;

  const _ItemLista({this.item, this.ultimoElemento});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: !item.nuevo
            ? Image(
                image: AssetImage(item.urlFoto),
                fit: BoxFit.cover,
              )
            : Image.file(
                new File(item.urlFoto),
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}

class ItemListaModel {
  final String urlFoto;
  final bool nuevo;

  ItemListaModel({this.urlFoto, this.nuevo = false});
}
