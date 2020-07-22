import 'package:flutter/material.dart';

class ArticleLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(alignment: Alignment.center, color: Colors.white, child: CircularProgressIndicator());
  }
}
