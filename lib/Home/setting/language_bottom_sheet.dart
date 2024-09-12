import 'package:flutter/material.dart';
import 'package:news_app/provider/App_provider.dart';
import 'package:news_app/them/AppColors.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatefulWidget {
  const LanguageBottomSheet({super.key});

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);

    return Container(
      margin: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
              onTap: () {
                provider.changeLanguage("en");
              },
              child: provider.appLanguage == 'en'
                  ? getSelectedItemWidget('english')
                  : getUnSelectedItemWidget('english')),
          InkWell(
              onTap: () {
                provider.changeLanguage('ar');
              },
              child: provider.appLanguage == 'ar'
                  ? getSelectedItemWidget('arabic')
                  : getUnSelectedItemWidget('arabic')),
        ],
      ),
    );
  }

  getSelectedItemWidget(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: AppColors.primryColor)),
        Icon(Icons.check)
      ],
    );
  }

  getUnSelectedItemWidget(String text) {
    return Text(text, style: Theme.of(context).textTheme.bodyMedium);
  }
}
