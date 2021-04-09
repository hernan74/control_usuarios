import 'package:flutter/material.dart';

import 'package:control_usuarios/src/pages/ficha_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Control usuarios',
      theme: ThemeData.light().copyWith(scaffoldBackgroundColor: Colors.white),
      home: FichaPage(),
    );
  }
}
