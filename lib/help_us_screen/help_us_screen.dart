import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../localizations.dart';

class HelpUsScreen extends StatefulWidget {
  @override
  _HelpUsScreenState createState() => _HelpUsScreenState();
}

class _HelpUsScreenState extends State<HelpUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).helpUsScreenTitle),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(15.h),
        child: Text(
          AppLocalizations.of(context).helpUsScreenText,
          style: TextStyle(fontSize: 17.sp),
          textAlign: TextAlign.justify,
        ),
      )),
    );
  }
}
