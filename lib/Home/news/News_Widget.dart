import 'package:flutter/material.dart';
import 'package:news_app/ApiManager/ApiManager.dart';
import 'package:news_app/Home/news/news_item.dart';
import 'package:news_app/model/sourceResponse.dart';

class NewsWidget extends StatefulWidget {
  Source source;

  NewsWidget({required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getBySourceId(widget.source.id ?? ''),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.cyan,
            ),
          );
        } else if (snapshot.hasError) {
          return Column(
            children: [
              Text('Sometheing went wrong '),
              ElevatedButton(
                  onPressed: () {
                    ApiManager.getBySourceId(widget.source.id ?? '');
                    setState(() {});
                  },
                  child: Text('Try Again')),
            ],
          );
        }
        if (snapshot.data!.status != 'ok') {
          return Column(
            children: [
              Text(snapshot.data!.message!),
              ElevatedButton(
                  onPressed: () {
                    ApiManager.getBySourceId(widget.source.id ?? '');
                    setState(() {});
                  },
                  child: Text('Try Again')),
            ],
          );
        }
        var newsList = snapshot.data!.articles!;
        return ListView.builder(
          itemBuilder: (context, index) {
            return NewsItem(news: newsList[index]);
          },
          itemCount: newsList.length,
        );
      },
    );
  }
}
