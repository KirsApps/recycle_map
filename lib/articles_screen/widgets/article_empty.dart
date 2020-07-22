import 'package:flutter/material.dart';

import '../../localizations.dart';

class ArticleEmpty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center, color: Colors.white, child: Text(AppLocalizations.of(context).noArticlesText));
  }
}
