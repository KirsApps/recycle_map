import 'package:flutter/material.dart';

import '../../localizations.dart';

class WasteTypesTextWidget extends StatelessWidget {
  final List<String> wasteTypes;
  WasteTypesTextWidget(this.wasteTypes);

  @override
  Widget build(BuildContext context) {
    return Text(_createWasteTypesText(wasteTypes, context));
  }

  String _createWasteTypesText(List<String> wasteTypes, BuildContext context) {
    return wasteTypes.map((type) {
      switch (type) {
        case 'glass':
          return AppLocalizations.of(context).glassWasteType;
        case 'paper':
          return AppLocalizations.of(context).paperWasteType;
        case 'plastic':
          return AppLocalizations.of(context).plasticWasteType;
        case 'metal':
          return AppLocalizations.of(context).metalWasteType;
        case 'hazardous':
          return AppLocalizations.of(context).hazardousWasteType;
        case 'battery':
          return AppLocalizations.of(context).batteryWasteType;
        case 'appliances':
          return AppLocalizations.of(context).appliancesWasteType;
        case 'lightBulb':
          return AppLocalizations.of(context).lightBulbWasteType;
        case 'other':
          return AppLocalizations.of(context).otherWasteType;
        default:
          return AppLocalizations.of(context).otherWasteType;
      }
    }).join(', ');
  }
}
