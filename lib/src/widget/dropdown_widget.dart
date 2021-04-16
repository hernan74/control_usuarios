import 'package:flutter/material.dart';

import 'package:control_usuarios/src/helpers/estilos.dart' as estilo;

class DropdownWidget extends StatefulWidget {
  final String titulo;
  final List<ItemExpancionPanelModel> items;
  final double ancho;
  final double alto;
  final double hintTextSize;

  const DropdownWidget({
    @required this.titulo,
    @required this.items,
    this.ancho = 200,
    this.alto = 60,
    this.hintTextSize = 22,
  });

  @override
  _DropdownWidgetState createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  String seleccion = '';
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.widget.ancho,
      height: this.widget.alto,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: ListTile(
            title: Text(
              '${this.widget.titulo}',
              style: TextStyle(
                fontSize: this.widget.hintTextSize,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            trailing: DropdownButtonHideUnderline(
              child: DropdownButton(
                  onChanged: (value) {
                    setState(() {
                      seleccion = value;
                    });
                  },
                  items: this
                      .widget
                      .items
                      .map((e) => DropdownMenuItem(
                            child: Text(e.titulo),
                            value: e.valor,
                          ))
                      .toList(),
                  hint: Text(seleccion ?? 'no tiene valor')),
            ),
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
