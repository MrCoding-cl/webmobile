import 'package:flutter/material.dart';
import 'package:notesapp/pages/constant/rutas.dart';
import 'package:notesapp/sqlite/sqlite_delete.dart';
import 'package:notesapp/sqlite/sqlite_helper.dart';
import 'package:notesapp/sqlite/sqlite_query.dart';
import 'package:provider/provider.dart';

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
      body: FutureBuilder(
        future: SQLiteHelper.getDB(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return _mostrarLista(context);
          } else
            return Center(
              child: CircularProgressIndicator(),
            );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _abrirAnadirNota(context),
        // ignore: prefer_const_constructors
        child: Icon(Icons.add),
      ),
    );
  }

  _mostrarLista(BuildContext context) {
    final SQliteQuery sqLiteQuery = Provider.of<SQliteQuery>(context);

    return ListView.builder(
      itemCount: sqLiteQuery.nota.length,
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          background: Container(
              color: Colors.red,
              child: Align(
                alignment: Alignment.center,
                child: Icon(Icons.delete),
              )),
          confirmDismiss: (direction) async {
            final bool result = await showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('¿Estás seguro?'),
                content: const Text('¿Deseas eliminar esta nota?'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: const Text('No'),
                  ),
                  TextButton(
                    onPressed: () => {
                      Navigator.of(context).pop(true),
                      SQLiteDelete().nota(sqLiteQuery.nota[index]),
                      sqLiteQuery.updateNotas(),
                    },
                    child: const Text('Sí'),
                  ),
                ],
              ),
            );
          },
          key: Key(sqLiteQuery.nota[index].id.toString()),
          direction: DismissDirection.endToStart,
          onDismissed: (direction) {
            SQLiteDelete().nota(sqLiteQuery.nota[index]);
            sqLiteQuery.updateNotas();
          },
          child: ListTile(
            title: Text(sqLiteQuery.nota[index].titulo),
            subtitle: Text(sqLiteQuery.nota[index].descripcion),
          ),
        );
      },
    );
  }

  void _abrirAnadirNota(BuildContext context) {
    Navigator.pushNamed(context, Rutas.anadirNota).then((value) {
      Provider.of<SQliteQuery>(context, listen: false).updateNotas();
    });
  }
}
