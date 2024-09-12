import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'NewsDetailScreen.dart';

class SearchResultsScreen extends StatelessWidget {
  final String query;
  final String? category;

  SearchResultsScreen({required this.query, this.category});

  Future<List<dynamic>> fetchNews(String query, String? category) async {
    final String apiKey = 'f0e2fc79a44a4eed8002e91089930959';
    String apiUrl =
        'https://newsapi.org/v2/top-headlines?q=$query&apiKey=$apiKey';

    if (category != null && category.isNotEmpty) {
      apiUrl += '&category=${category.toLowerCase()}';
    }

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      return json['articles'];
    } else {
      throw Exception('Failed to load news');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Results'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: fetchNews(query, category),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No results found'));
          } else {
            List<dynamic> articles = snapshot.data!;
            double width = MediaQuery.of(context).size.width;
            double height = MediaQuery.of(context).size.height;
            return Container(
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: articles.length,
                itemBuilder: (context, index) {
                  var article = articles[index];
                  return Card(
                    elevation: 5,
                    child: ListTile(
                      leading: article['urlToImage'] != null
                          ? CachedNetworkImage(
                              imageUrl: article['urlToImage'],
                              width: 120,
                              height: 100,
                              fit: BoxFit.fill,
                              placeholder: (context, url) =>
                                  Center(child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            )
                          : Container(
                              width: 100,
                              color: Colors.grey,
                            ),
                      title: Text(article['title']),
                      subtitle: Text(
                        article['description'] ?? 'No description',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                NewsDetailScreen(article: article),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
