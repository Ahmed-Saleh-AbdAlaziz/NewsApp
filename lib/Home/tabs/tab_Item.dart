import 'package:flutter/material.dart';
import 'package:news_app/model/sourceResponse.dart';

class TabItem extends StatelessWidget {
  bool isSelected;
  Source source;

  TabItem({required this.isSelected, required this.source});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.green, width: 2),
        color: isSelected ? Colors.green : Colors.transparent,
      ),
      child: Text(
        source.name ?? '',
        style: TextStyle(color: isSelected ? Colors.white : Colors.green),
      ),
    );
  }
}
