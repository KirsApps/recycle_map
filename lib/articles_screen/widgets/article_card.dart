import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recycle_map/articles_screen/widgets/article_widget.dart';

import '../models/models.dart';

class ArticleCard extends StatelessWidget {
  final Article article;
  ArticleCard({this.article});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) {
          return ArticleWidget(
            article: article,
          );
        })),
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
                  article.description,
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: Colors.black54,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
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
