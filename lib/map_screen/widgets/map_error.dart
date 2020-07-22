import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recycle_map/localizations.dart';

class MapError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Icon(
            Icons.error_outline,
            size: 50.h,
          ),
          Text(
            AppLocalizations.of(context).errorText,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
