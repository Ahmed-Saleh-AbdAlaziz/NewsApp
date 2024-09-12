import 'dart:ui';

import 'package:news_app/them/AppColors.dart';

class Category {
  String id;
  String title;
  String imagePath;
  Color color;

  Category({
    required this.id,
    required this.title,
    required this.imagePath,
    required this.color,
  });

  static List<Category> getCategoryList() {
    return [
      Category(
          id: 'sports',
          title: 'sport',
          imagePath: 'assets/images/ball.png',
          color: AppColors.redColor),
      Category(
          id: 'general',
          title: 'General',
          imagePath: 'assets/images/Politics.png',
          color: AppColors.blueColor),
      Category(
          id: 'health',
          title: 'Health',
          imagePath: 'assets/images/health.png',
          color: AppColors.pinkColor),
      Category(
          id: 'business',
          title: 'Business',
          imagePath: 'assets/images/bussines.png',
          color: AppColors.copperOrangeColor),
      Category(
          id: 'entertainment',
          title: 'Entertainment',
          imagePath: 'assets/images/environment.png',
          color: AppColors.blue2Color),
      Category(
          id: 'science',
          title: 'Science',
          imagePath: 'assets/images/science.png',
          color: AppColors.lemonYellowColor),
    ];
  }
}
