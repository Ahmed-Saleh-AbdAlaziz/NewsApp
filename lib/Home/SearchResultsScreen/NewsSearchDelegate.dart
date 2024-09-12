import 'package:flutter/material.dart';
import 'package:news_app/Home/SearchResultsScreen/SearchResultsScreen.dart';

class NewsSearchDelegate extends SearchDelegate {
  final String? selectedCategory;

  NewsSearchDelegate({this.selectedCategory});

  @override
  String get searchFieldLabel => 'Search News';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.search),
        onPressed: () {
          if (query.isNotEmpty) {
            showResults(context);
          }
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isEmpty) {
      return Center(child: Text('Please enter a search query.'));
    }
    return SearchResultsScreen(query: query, category: selectedCategory);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(child: Text('Search for news...'));
  }
}
