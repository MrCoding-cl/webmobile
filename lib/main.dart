import 'package:flutter/material.dart';

import 'pages/constant/rutas.dart';
import 'pages/home/anadir_nota.dart';
import 'pages/home/lista_nota.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: Rutas.home,
      routes: {
        Rutas.home: (BuildContext context) => const ListaNota(),
        Rutas.anadirNota: (BuildContext context) => const AnadirNota(),
      },
    );
  }
}
