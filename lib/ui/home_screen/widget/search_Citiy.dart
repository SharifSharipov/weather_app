import 'package:flutter/material.dart';

import '../../utils/country.dart';

class SearchViewDelegate extends SearchDelegate {
  final List<String> suggestionList = regions;

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.close),
        ),
      ];

  @override
  Widget buildLeading(BuildContext context) {
    for (var city in suggestionList) {
      if (city.toLowerCase().contains(query.toLowerCase())) {
        matchquery.add(city);
      }
    }
    return ListView.builder(
      itemCount: matchquery.length,
      itemBuilder: (context, index) {
        var result = matchquery[index];
        return ListTile(
          title: Text(result), // Provide 'title' as a named argument
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    for (var city in suggestionList) {
      if (city.toLowerCase().contains(query.toLowerCase())) {
        matchquery.add(city);
      }
    }
    return ListView.builder(
      itemCount: matchquery.length,
      itemBuilder: (context, index) {
        var result = matchquery[index];
        return ListTile(
          title: Text(result), // Provide 'title' as a named argument
        );
      },
    );
  }
  @override
  Widget buildResults(BuildContext context) {
    for (var city in suggestionList) {
      if (city.toLowerCase().contains(query.toLowerCase())) {
        matchquery.add(city);
      }
    }
    return ListView.builder(
      itemCount: matchquery.length,
      itemBuilder: (context, index) {
        var result = matchquery[index];
        return ListTile(
          title: Text(result), // Provide 'title' as a named argument
        );
      },
    );
  }


}

/* final List<String> suggestions = suggestionList.where((searchResult) {
      final result = searchResult.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();
*/
List<String> matchquery = [];
/*  Widget buildSuggestions(BuildContext context) {
    for (var city in suggestionList) {
      if (city.toLowerCase().contains(query.toLowerCase())) {
        matchquery.add(city);
      }
    }
    return ListView.builder(
      itemCount: matchquery.length,
      itemBuilder: (context, index) {
        var result = matchquery[index];
        return ListTile(
          title: Text(result), // Provide 'title' as a named argument
        );
      },
    );
  }

  import 'package:flutter/material.dart';

class SearchViewDelegate extends SearchDelegate {
  final List<String> suggestionList;

  SearchViewDelegate({required this.suggestionList});

  @override
  List<Widget>? buildActions(BuildContext context) => [
    IconButton(
      onPressed: () {
        query = "";
      },
      icon: const Icon(Icons.close),
    ),
  ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
    onPressed: () {
      close(context, query);
    },
    icon: const Icon(Icons.arrow_back_ios),
  );

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text(
        query,
        style: const TextStyle(fontSize: 64),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<String> suggestions = suggestionList.where((searchResult) {
      final result = searchResult.toLowerCase();
      final input=query.toLowerCase();
      return result.contains(input);
    }).toList();

    return  Padding(
        padding:const EdgeInsets.all(20),
      child:Wrap(
        spacing: 10,
        runSpacing: 10,
        children: List.generate(suggestions.length, (index) => GestureDetector(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: Colors.black,),
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
            child: Text(
              suggestions[index],
              style: const TextStyle(color: Colors.white,fontSize: 20),
            ),
          ),
          onTap: (){
            query=suggestions[index];
          },
        )),

      ) ,

    );
  }
}*/