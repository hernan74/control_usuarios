import 'package:flutter/material.dart';

class GridViewWidget extends StatelessWidget {
  final List<Widget> listaElementos;
  final double widthActual;
  final double widthItem;
  final double maxHeightItem;

  const GridViewWidget({
    @required this.listaElementos,
    @required this.widthActual,
    @required this.widthItem,
    this.maxHeightItem = 120.0,
  });
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: ClampingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: widthActual ~/ (widthItem + 12),
          mainAxisExtent: maxHeightItem),
      itemBuilder: (_, index) => listaElementos[index],
      itemCount: listaElementos.length,
    );
  }
}
