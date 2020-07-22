import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recycle_map/articles_screen/articles_screen.dart';
import 'package:recycle_map/help_us_screen/help_us_screen.dart';

import '../localizations.dart';

class ScreenDrawer extends StatelessWidget {
  const ScreenDrawer();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Recycle Map",
                style: TextStyle(color: Colors.white, fontSize: 20.sp),
              ),
            ),
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                image: const DecorationImage(image: AssetImage("assets/drawer_header.png"), fit: BoxFit.contain)),
          ),
          ListTile(
            title: Text(AppLocalizations.of(context).articlesScreenTitle),
            leading: Icon(
              Icons.library_books,
              size: 25.w,
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return ArticlesScreen(
                  localeName: AppLocalizations.of(context).localeName,
                );
              }));
            },
          ),
          ListTile(
            title: Text(AppLocalizations.of(context).helpUsTitle),
            leading: Icon(
              Icons.edit_location,
              size: 25.w,
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return HelpUsScreen();
              }));
            },
          ),
        ],
      ),
    );
  }
}
