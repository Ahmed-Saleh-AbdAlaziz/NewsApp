import 'package:flutter/material.dart';
import 'package:news_app/Home/category/Category_Item.dart';
import 'package:news_app/model/category.dart';

class CategoryFragment extends StatelessWidget {
  static const String routName = 'categoryFragment';

  var categoryList = Category.getCategoryList();
  Function onCategoryItemClick;

  CategoryFragment({required this.onCategoryItemClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      child: Column(
        children: [
          Text(
            'Pick your category \n of interest',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      onCategoryItemClick(categoryList[index]);
                    },
                    child: CategoryItem(
                      index: index,
                      category: categoryList[index],
                    ));
              },
              itemCount: categoryList.length,
            ),
          )
        ],
      ),
    );
  }
}
