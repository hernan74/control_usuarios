import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

import 'package:control_usuarios/src/helpers/import_helpers.dart';
import 'package:control_usuarios/src/utils/size_scream_util.dart';
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
  //TODO esto se debe modificar cuando este BLoc
  List<Widget> listaElementos = [];
  double widthActual = 0;
  @override
  Widget build(BuildContext context) {
    widthActual = (widthActual == 0)
        ? sizeScreemUtil(
            sizeActual: this.widget.maxWidth * 22 / 100,
            sizeMin: 68,
            sizeMax: 108)
        : widthActual;
    return Container(
      height: this.widget.maxHeight,
      width: sizeScreemUtil(
          sizeActual: widthActual, sizeMin: 70, sizeMax: this.widget.maxWidth),
      alignment: Alignment.center,
      child: MediaQuery.removePadding(
        context: context,
        removeLeft: true,
        removeRight: true,
        child: Scrollbar(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              children: [
                Expanded(
                  child: GridViewWidget(
                      scrollDirection: Axis.horizontal,
                      maxWidth: this.widget.maxWidth,
                      maxHeightItem: 100,
                      widthItem: this.widget.maxWidth - 12,
                      listaElementos: this
                          .listaElementos
                          .map((i) => _ItemLista(
                                altoMaximo: this.widget.maxHeight,
                                image: i,
                              ))
                          .toList()),
                ),
                Container(
                  width: sizeScreemUtil(
                      sizeActual: this.widget.maxWidth * 20 / 100,
                      sizeMin: 60,
                      sizeMax: 100),
                  height: sizeScreemUtil(
                      sizeActual: this.widget.maxHeight,
                      sizeMin: 60,
                      sizeMax: 150),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border:
                          Border.all(width: 3, color: estilo.colorPrimarioUno)),
                  child: IconButton(
                    icon: FaIcon(
                      FontAwesomeIcons.plusSquare,
                      size: sizeScreemUtil(
                          sizeActual: widget.maxHeight * 40 / 100,
                          sizeMin: 20,
                          sizeMax: 60),
                      color: estilo.colorPrimarioUnoGradiente,
                    ),
                    onPressed: () async {
                      Widget image =
                          await imagePickerFutureWidget(ImageSource.gallery);
                      if (image != null) {
                        this.listaElementos.add(image);

                        this.widthActual = this.widthActual + 100;
                        setState(() {});
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ItemLista extends StatelessWidget {
  final Widget image;
  final double altoMaximo;
  const _ItemLista({this.image, @required this.altoMaximo});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(width: 1, color: estilo.colorPrimarioUno)),
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Stack(alignment: Alignment.center, children: [
          ClipRRect(borderRadius: BorderRadius.circular(10), child: image),
          Positioned(
              top: 0,
              right: 0,
              child: CirculoWidget(
                utilizaShadow: false,
                colorCiculo: estilo.colorPrimarioUno,
                contenidoCirculo: Icon(
                  Icons.delete_outline,
                  color: Colors.white,
                  size: sizeScreemUtil(
                      sizeActual: altoMaximo * 27 / 100,
                      sizeMin: 10,
                      sizeMax: 50),
                ),
                sizeCirculo: sizeScreemUtil(
                    sizeActual: altoMaximo * 27 / 100,
                    sizeMin: 10,
                    sizeMax: 50),
              ))
        ]),
      ),
      onTap: () async {
        //TODO Terminar esto cuando se implemente Bloc
        await showDialog(
            context: context,
            builder: (_) => ImageDialog(
                  image: this.image,
                ));
      },
    );
  }
}

class ImageDialog extends StatelessWidget {
  final Widget image;

  const ImageDialog({this.image});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 200,
        height: 200,
        child: image,
      ),
    );
  }
}
