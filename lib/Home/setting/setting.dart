import 'package:flutter/material.dart';
import 'package:news_app/Home/setting/language_bottom_sheet.dart';
import 'package:news_app/provider/App_provider.dart';
import 'package:provider/provider.dart';

import '../../them/AppColors.dart';

class Settings extends StatefulWidget {
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    Map<String, String> languages = {
      'en': 'english',
      'ar': 'arabic',
    };

    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('language',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 25,
                  )),
          Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(
                top: 15,
                bottom: 15,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.whiteColor),
              child: InkWell(
                onTap: () {
                  showLanguageBottomSheet();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      languages[provider.appLanguage]!,
                      style: Theme.of(context).textTheme.titleLarge,
                      textAlign: TextAlign.start,
                    ),
                    Icon(
                      Icons.keyboard_arrow_down_outlined,
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => LanguageBottomSheet(),
    );
  }
}
