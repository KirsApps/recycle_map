import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../localizations.dart';
import '../models/models.dart';

class WorkingDaysTableWidget extends StatelessWidget {
  final TimeTable timeTable;
  WorkingDaysTableWidget({this.timeTable});
  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(children: [
          TableCell(
            child: Text(
              AppLocalizations.of(context).monday,
              textAlign: TextAlign.center,
            ),
          ),
          TableCell(
            child: Text(
              AppLocalizations.of(context).tuesday,
              textAlign: TextAlign.center,
            ),
          ),
          TableCell(
            child: Text(
              AppLocalizations.of(context).wednesday,
              textAlign: TextAlign.center,
            ),
          ),
          TableCell(
            child: Text(
              AppLocalizations.of(context).thursday,
              textAlign: TextAlign.center,
            ),
          ),
          TableCell(
            child: Text(
              AppLocalizations.of(context).friday,
              textAlign: TextAlign.center,
            ),
          ),
          TableCell(
            child: Text(
              AppLocalizations.of(context).saturday,
              textAlign: TextAlign.center,
            ),
          ),
          TableCell(
            child: Text(
              AppLocalizations.of(context).sunday,
              textAlign: TextAlign.center,
            ),
          ),
        ]),
        TableRow(children: [
          TableCell(
            child: timeTable.monday is DayOff
                ? Text(
                    AppLocalizations.of(context).dayOff,
                    style: TextStyle(fontSize: 10.sp),
                    textAlign: TextAlign.center,
                  )
                : Text(
                    "${(timeTable.monday as WorkDay).startTime}\n${(timeTable.monday as WorkDay).endTime}",
                    style: TextStyle(fontSize: 10.sp),
                    textAlign: TextAlign.center,
                  ),
          ),
          TableCell(
            child: timeTable.tuesday is DayOff
                ? Text(
                    AppLocalizations.of(context).dayOff,
                    style: TextStyle(fontSize: 10.sp),
                    textAlign: TextAlign.center,
                  )
                : Text(
                    "${(timeTable.tuesday as WorkDay).startTime}\n${(timeTable.tuesday as WorkDay).endTime}",
                    style: TextStyle(fontSize: 10.sp),
                    textAlign: TextAlign.center,
                  ),
          ),
          TableCell(
            child: timeTable.wednesday is DayOff
                ? Text(
                    AppLocalizations.of(context).dayOff,
                    style: TextStyle(fontSize: 10.sp),
                    textAlign: TextAlign.center,
                  )
                : Text(
                    "${(timeTable.wednesday as WorkDay).startTime}\n${(timeTable.wednesday as WorkDay).endTime}",
                    style: TextStyle(
                      fontSize: 10.sp,
                    ),
                    textAlign: TextAlign.center,
                  ),
          ),
          TableCell(
            child: timeTable.thursday is DayOff
                ? Text(
                    AppLocalizations.of(context).dayOff,
                    style: TextStyle(fontSize: 10.sp),
                    textAlign: TextAlign.center,
                  )
                : Text(
                    "${(timeTable.thursday as WorkDay).startTime}\n${(timeTable.thursday as WorkDay).endTime}",
                    style: TextStyle(fontSize: 10.sp),
                    textAlign: TextAlign.center,
                  ),
          ),
          TableCell(
            child: timeTable.friday is DayOff
                ? Text(
                    AppLocalizations.of(context).dayOff,
                    style: TextStyle(fontSize: 10.sp),
                    textAlign: TextAlign.center,
                  )
                : Text(
                    "${(timeTable.friday as WorkDay).startTime}\n${(timeTable.friday as WorkDay).endTime}",
                    style: TextStyle(fontSize: 10.sp),
                    textAlign: TextAlign.center,
                  ),
          ),
          TableCell(
            child: timeTable.saturday is DayOff
                ? Text(
                    AppLocalizations.of(context).dayOff,
                    style: TextStyle(fontSize: 10.sp),
                    textAlign: TextAlign.center,
                  )
                : Text(
                    "${(timeTable.saturday as WorkDay).startTime}\n${(timeTable.saturday as WorkDay).endTime}",
                    style: TextStyle(fontSize: 10.sp),
                    textAlign: TextAlign.center,
                  ),
          ),
          TableCell(
            child: timeTable.sunday is DayOff
                ? Text(
                    AppLocalizations.of(context).dayOff,
                    style: TextStyle(fontSize: 10.sp),
                    textAlign: TextAlign.center,
                  )
                : Text(
                    "${(timeTable.sunday as WorkDay).startTime}\n${(timeTable.sunday as WorkDay).endTime}",
                    style: TextStyle(fontSize: 10.sp),
                    textAlign: TextAlign.center,
                  ),
          ),
        ])
      ],
    );
  }
}
