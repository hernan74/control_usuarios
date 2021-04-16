import 'package:flutter/material.dart';

class GridViewWidget extends StatelessWidget {
  final List<Widget> listaElementos;
  final double maxWidth;
  final double widthItem;
  final double maxHeightItem;
  final Axis scrollDirection;

  const GridViewWidget({
    @required this.listaElementos,
    @required this.maxWidth,
    @required this.widthItem,
    this.maxHeightItem = 120.0,
    this.scrollDirection = Axis.vertical,
  });
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: scrollDirection,
      physics: ClampingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: maxWidth ~/ (widthItem + 12),
          mainAxisExtent: maxHeightItem),
      itemBuilder: (_, index) => listaElementos[index],
      itemCount: listaElementos.length,
    );
  }
}
