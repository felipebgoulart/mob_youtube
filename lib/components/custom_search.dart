import 'package:flutter/material.dart';

class CustomSearch extends SearchDelegate<String> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => {
          query = ''
        },
        icon: Icon(Icons.clear)
      )
    ];
  }
  
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () => {
          close(
            context,
            ''
          )
        },
        icon: Icon(Icons.arrow_back)
      );
  }
  
  @override
  Widget buildResults(BuildContext context) {
    Future.delayed(Duration.zero, () {
      close(
        context,
        query
      );
    });
    return Container();
  }
  
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> list = List.empty(growable: true);

    if (query.isNotEmpty) {
      list = [
        'Android', 'Flutter', 'iOS', 'Swift', 'Javascript', 'Java', 'Angular', 'Node'
      ].where(
        (String value) => value.toLowerCase().startsWith(query.toLowerCase())
      ).toList();

      return ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(list[index]),
            onTap: () => {
              close(context, list[index])
            },
          );
        }
      );
    } else {
      return Center(
        child: Text('Nenhum resultado para a pesquisa...'),
      );
    }

  }

}