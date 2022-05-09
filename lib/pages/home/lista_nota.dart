import 'package:flutter/material.dart';

class ListaNota extends StatelessWidget {
  const ListaNota({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Lista de notas'),
        ),
      ),
      body: _mostrarLista(),
      floatingActionButton: const FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, Rutas.anadirNota),
        child: Icon(Icons.add),
      ),
    );
  }

  _mostrarLista() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text('Nota $index'),
        );
      },
    );
  }
}
