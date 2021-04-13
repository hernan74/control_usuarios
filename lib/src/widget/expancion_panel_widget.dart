import 'package:flutter/material.dart';

import 'package:control_usuarios/src/helpers/estilos.dart' as estilo;

class ExpancionPanelWidget extends StatefulWidget {
  final String titulo;
  final List<ItemExpancionPanelModel> items;
  final double ancho;
  final double alto;

  const ExpancionPanelWidget({
    @required this.titulo,
    @required this.items,
    this.ancho = 200,
    this.alto = 30,
  });

  @override
  _ExpancionPanelWidgetState createState() => _ExpancionPanelWidgetState();
}

class _ExpancionPanelWidgetState extends State<ExpancionPanelWidget> {
  String seleccion = '';
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: this.widget.ancho,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: ExpansionPanelList(
            expansionCallback: (int index, bool isExpanded) {
              setState(() {
                this.isExpanded = !isExpanded;
              });
            },
            children: [
              ExpansionPanel(
                canTapOnHeader: true,
                body: Column(children: [
                  _ItemExpancionPanel(
                    items: this.widget.items,
                  )
                ]),
                isExpanded: this.isExpanded,
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return Container(
                    padding: EdgeInsets.only(
                        top: size.height * 1.2 / 100,
                        left: size.width * 3.4 / 100),
                    height: 10,
                    child: Text(widget.titulo,
                        style: TextStyle(
                            fontSize: estilo.sizeText,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey)),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ItemExpancionPanelModel {
  final String titulo;
  final String valor;

  ItemExpancionPanelModel({this.titulo, this.valor});
}

class _ItemExpancionPanel extends StatefulWidget {
  final List<ItemExpancionPanelModel> items;
  const _ItemExpancionPanel({this.items});

  @override
  _ItemExpancionPanelState createState() => _ItemExpancionPanelState();
}

class _ItemExpancionPanelState extends State<_ItemExpancionPanel> {
  String seleccion = '';
  @override
  Widget build(BuildContext context) {
    return Column(
        children: this
            .widget
            .items
            .map((model) => RadioListTile(
                  activeColor: estilo.colorPrimarioUno,
                  title: Text(model.titulo,
                      style: TextStyle(
                          fontSize: estilo.sizeText, color: Colors.black)),
                  value: model.valor,
                  groupValue: this.seleccion,
                  onChanged: (value) {
                    setState(() {
                      this.seleccion = value;
                    });
                  },
                ))
            .toList());
  }
}
