import 'package:flutter/material.dart';
import 'package:news_app/model/category.dart';
import 'package:news_app/them/AppColors.dart';

class CategoryItem extends StatelessWidget {
  Category category;
  int index;

  CategoryItem({required this.category, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: category.color,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
            bottomLeft: Radius.circular(index % 2 == 0 ? 20 : 0),
            bottomRight: Radius.circular(index % 2 != 0 ? 20 : 0),
          ),
        ),
        child: Column(
          children: [
            Image.asset(
              category.imagePath,
              height: MediaQuery.of(context).size.height * 0.17,
            ),
            Text(category.title,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: AppColors.whiteColor)),
          ],
        ));
  }
}
