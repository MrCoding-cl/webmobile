import 'package:flutter/material.dart';

class AnadirNota extends StatelessWidget {
  const AnadirNota({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Añadir nota'),
        ),
      ),
    );
  }
}
