import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../localizations.dart';
import '../models/models.dart';
import '../widgets/waste_types_text.dart';
import '../widgets/working_days_table.dart';

class RecycleCenterWidget extends StatelessWidget {
  final RecycleCenterMarker recycleCenter;
  RecycleCenterWidget(this.recycleCenter);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recycleCenter.name),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(
                Icons.pin_drop,
                size: 24.w,
              ),
              title: Text(recycleCenter.address),
            ),
            ExpansionTile(
              backgroundColor: Colors.white30,
              leading: Icon(
                Icons.chrome_reader_mode,
                size: 24.w,
              ),
              title: Text(AppLocalizations.of(context).descriptionTitle),
              children: <Widget>[ListTile(title: Text(recycleCenter.description))],
              initiallyExpanded: true,
            ),
            if (recycleCenter.wasteTypes != null)
              ListTile(
                leading: Icon(
                  Icons.loop,
                  size: 24.w,
                ),
                title: Text(AppLocalizations.of(context).wasteTypesTitle),
                subtitle: WasteTypesTextWidget(recycleCenter.wasteTypes),
              ),
            if (recycleCenter.timeTable != null)
              ListTile(
                leading: Icon(
                  Icons.watch_later,
                  size: 24.w,
                ),
                title: WorkingDaysTableWidget(
                  timeTable: recycleCenter.timeTable,
                ),
              ),
            if (recycleCenter.contactsInformationExists)
              ExpansionTile(
                backgroundColor: Colors.white30,
                leading: Icon(
                  Icons.info,
                  size: 24.w,
                ),
                title: Text(AppLocalizations.of(context).contactsTitle),
                children: <Widget>[
                  if (recycleCenter.phone != null)
                    ListTile(
                      leading: Icon(
                        Icons.phone,
                        size: 24.w,
                      ),
                      title: Text(recycleCenter.phone),
                    ),
                  if (recycleCenter.email != null)
                    ListTile(
                      leading: Icon(
                        Icons.email,
                        size: 24.w,
                      ),
                      title: Text(recycleCenter.email),
                    ),
                  if (recycleCenter.site != null)
                    ListTile(
                      leading: Icon(
                        Icons.link,
                        size: 24.w,
                      ),
                      title: Text(recycleCenter.site),
                    )
                ],
                initiallyExpanded: true,
              ),
          ],
        ),
      ),
    );
  }
}
