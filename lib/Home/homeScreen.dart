import 'package:flutter/material.dart';
import 'package:news_app/Home/Home_Drawer.dart';
import 'package:news_app/Home/SearchResultsScreen/NewsSearchDelegate.dart';
import 'package:news_app/Home/category/category_details.dart';
import 'package:news_app/Home/category/category_fragment.dart';
import 'package:news_app/Home/setting/setting.dart';
import 'package:news_app/model/category.dart';
import 'package:news_app/them/AppColors.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Category? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectSideMenuItem == HomeDrawer.settings
              ? "Settings"
              : selectedCategory == null
                  ? 'News App'
                  : selectedCategory!.title,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearchBar(context);
            },
          ),
        ],
        centerTitle: true,
        backgroundColor: AppColors.primryColor,
      ),
      drawer: Drawer(
        child: HomeDrawer(onSideMenuItemClick: onSideMenuItemClick),
      ),
      body: selectSideMenuItem == HomeDrawer.settings
          ? Settings()
          : selectedCategory == null
              ? CategoryFragment(onCategoryItemClick: onCategoryItemClick)
              : CategoryDetails(
                  category: selectedCategory!,
                ),
    );
  }

  int selectSideMenuItem = HomeDrawer.categories;

  void onCategoryItemClick(Category newCategory) {
    setState(() {
      selectedCategory = newCategory;
    });
  }

  void onSideMenuItemClick(int newSideMenuItem) {
    setState(() {
      selectSideMenuItem = newSideMenuItem;
      selectedCategory = null;
    });
    Navigator.pop(context);
  }

  void showSearchBar(BuildContext context) {
    showSearch(
      context: context,
      delegate: NewsSearchDelegate(selectedCategory: selectedCategory?.title),
    );
  }
}
