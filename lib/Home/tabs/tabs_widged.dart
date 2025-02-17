import 'package:flutter/material.dart';
import 'package:news_app/Home/news/News_Widget.dart';
import 'package:news_app/Home/tabs/tab_Item.dart';
import 'package:news_app/model/sourceResponse.dart';

class TabsWidget extends StatefulWidget {
  List<Source> sourcesList;

  TabsWidget({required this.sourcesList});

  @override
  State<TabsWidget> createState() => _TabsWidgetState();
}

class _TabsWidgetState extends State<TabsWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.sourcesList.length,
        child: Column(
          children: [
            TabBar(
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },
              isScrollable: true,
              indicatorColor: Colors.transparent,
              tabs: widget.sourcesList
                  .map((source) => TabItem(
                        isSelected:
                            selectedIndex == widget.sourcesList.indexOf(source),
                        source: source,
                      ))
                  .toList(),
            ),
            Expanded(
                child: NewsWidget(source: widget.sourcesList[selectedIndex])),
          ],
        ));
  }
}
