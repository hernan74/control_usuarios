import 'package:flutter/material.dart';

class ExpancionPanelWidget extends StatefulWidget {
  final Widget contenido;

  const ExpancionPanelWidget({@required this.contenido});

  @override
  _ExpancionPanelWidgetState createState() => _ExpancionPanelWidgetState();
}

class _ExpancionPanelWidgetState extends State<ExpancionPanelWidget> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          this.isExpanded = !isExpanded;
        });
      },
      children: [
        ExpansionPanel(
          body: Text('titulo'),
          isExpanded: this.isExpanded,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text('valor'),
            );
          },
        )
      ],
    );
  }
}
