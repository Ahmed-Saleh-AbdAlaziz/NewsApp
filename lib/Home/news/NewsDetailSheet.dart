import 'package:flutter/material.dart';
import 'package:news_app/model/News_Respons.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailSheet extends StatelessWidget {
  final News news;

  NewsDetailSheet({required this.news});

  Future<void> _launchURL() async {
    final url = news.url;
    if (url != null && await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'لا يمكن فتح الرابط: $url';
    }
  }

  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.all(16.0),
        height: MediaQuery.of(context).size.height * 0.5,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.0),
              Text(
                news.title ?? '',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: 16.0),
              Text(
                news.content ?? 'No content available',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              InkWell(
                onTap: _launchURL,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'View Full Article ',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Icon(Icons.arrow_right, size: 50),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
