import 'package:flutter/material.dart';
import 'package:news_app/ApiManager/ApiManager.dart';
import 'package:news_app/Home/tabs/tabs_widged.dart';
import 'package:news_app/model/category.dart';
import 'package:news_app/model/sourceResponse.dart';

class CategoryDetails extends StatefulWidget {
  Category category;

  CategoryDetails({required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponse?>(
        future: ApiManager.getSources(widget.category.id),
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
                      ApiManager.getSources(widget.category.id);
                      setState(() {});
                    },
                    child: Text('Try Again')),
              ],
            );
          }
          if (snapshot.data!.status != 'ok') {
            return Column(
              children: [
                Text(snapshot.data!.massage!),
                ElevatedButton(
                    onPressed: () {
                      ApiManager.getSources(widget.category.id);
                    },
                    child: Text('Try Again')),
              ],
            );
          }
          var sourceList = snapshot.data!.source!;
          return TabsWidget(sourcesList: sourceList);
        });
  }
}
