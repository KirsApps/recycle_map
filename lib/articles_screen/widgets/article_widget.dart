import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/models.dart';

class ArticleWidget extends StatelessWidget {
  final Article article;
  ArticleWidget({@required this.article});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                article.title,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.justify,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.h),
                  child: Text(
                    article.body,
                    style: TextStyle(fontSize: 17.sp),
                    textAlign: TextAlign.justify,
                  )),
              Text(
                article.date,
                style: TextStyle(
                  fontSize: 13.sp,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
