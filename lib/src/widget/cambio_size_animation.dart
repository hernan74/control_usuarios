import 'package:flutter/material.dart';

class CambioSizeAnimation extends StatefulWidget {
  final double sizeIniciar;
  final double sizeFinal;
  final Widget child;

  const CambioSizeAnimation(
      {@required this.sizeIniciar,
      @required this.sizeFinal,
      @required this.child});

  @override
  _CambioSizeAnimationState createState() => _CambioSizeAnimationState();
}

class _CambioSizeAnimationState extends State<CambioSizeAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> size;

  @override
  void initState() {
    controller =
        new AnimationController(vsync: this, duration: Duration(seconds: 1));
    size = Tween(begin: widget.sizeIniciar, end: widget.sizeFinal)
        .animate(controller);

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();
    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget child) {
        return Container(
          width: size.value,
          child: widget.child,
        );
      },
    );
  }
}
