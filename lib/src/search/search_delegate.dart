import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate {
  String seleccion = '';
//final provider= new Provider();

  final peliculas = [
    'capitan america',
    'hellboy',
  ];
  final recientes = [
    'reciente',
    'reciente1',
  ];
  @override
  List<Widget> buildActions(BuildContext context) {
    //Acciones de la appBart

    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    //Icono de la izquierda del appBar
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    //Crea los resultados que se va a mostrar
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //Son las sugerencias que se mostrara

    if (query.isEmpty) return Container();

    //return FutureBuilder(
    //  future: provider.buscar(query),
    //  builder: (BuildContext context,AsyncSnapshot<List<Model>> snapshot){
    //    if(!snapshot.hasData)
    //      return Center(
    //        child: CircularProgressIndicator(),
    //      );
    //    else
    //      return _contruirResultado(snapshot.data);
    //  },
    //  );
  }

  @override
  String get searchFieldLabel => 'Buscar';
//
// _contruirResultado(List<Model> resultados) {
//   return ListView.builder(
//     itemCount: resultados.length,
//     itemBuilder: (context, i) {
//       resultados[i].uniqueId = '${resultados[i].id}+-busqueda';
//       return ListTile(
//         title: Text('Titulo'),
//         subtitle: Text('Subtitulo'),
//       );
//     },
//   );
// }
}
