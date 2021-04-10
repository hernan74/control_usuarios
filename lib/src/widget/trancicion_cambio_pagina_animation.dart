import 'package:flutter/material.dart';

Route trancicionCambioPaginaAnimation(Widget child) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => child,
    transitionDuration: Duration(milliseconds: 1200),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final curveAnimation =
          CurvedAnimation(parent: animation, curve: Curves.linear);

      return FadeTransition(
          opacity: Tween<double>(begin: 0.0, end: 1.0).animate(curveAnimation),
          child: child);
    },
  );
}
