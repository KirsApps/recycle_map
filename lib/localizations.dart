import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'l10n/messages_all.dart';

class AppLocalizations {
  AppLocalizations(this.localeName);
  static Future<AppLocalizations> load(Locale locale) {
    final String name = locale.countryCode == null ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return AppLocalizations(localeName);
    });
  }

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  final String localeName;

  String get helpUsTitle {
    return Intl.message(
      'Help us',
      name: 'helpUsTitle',
    );
  }

  String get mapScreenTitle {
    return Intl.message('Recycle Map', name: 'mapScreenTitle');
  }

  String get articlesScreenTitle {
    return Intl.message('Articles', name: 'articlesScreenTitle');
  }

  String get workingHoursTitle {
    return Intl.message('Working hours', name: 'workingHoursTitle');
  }

  String get descriptionTitle {
    return Intl.message('Description', name: 'descriptionTitle');
  }

  String get contactsTitle {
    return Intl.message('Contacts', name: 'contactsTitle');
  }

  String get monday {
    return Intl.message('Mo', name: 'monday');
  }

  String get tuesday {
    return Intl.message('Tu', name: 'tuesday');
  }

  String get wednesday {
    return Intl.message('We', name: 'wednesday');
  }

  String get thursday {
    return Intl.message('Th', name: 'thursday');
  }

  String get friday {
    return Intl.message('Fr', name: 'friday');
  }

  String get saturday {
    return Intl.message('Sa', name: 'saturday');
  }

  String get sunday {
    return Intl.message('Su', name: 'sunday');
  }

  String get dayOff {
    return Intl.message('Day\nOff', name: 'dayOff');
  }

  String get errorText {
    return Intl.message(
      'Something went wrong.\nPlease try again.',
      name: 'errorText',
    );
  }

  String get glassWasteType {
    return Intl.message(
      'Glass',
      name: 'glassWasteType',
    );
  }

  String get paperWasteType {
    return Intl.message(
      'Paper',
      name: 'paperWasteType',
    );
  }

  String get plasticWasteType {
    return Intl.message(
      'Plastic',
      name: 'plasticWasteType',
    );
  }

  String get metalWasteType {
    return Intl.message(
      'Metal',
      name: 'metalWasteType',
    );
  }

  String get hazardousWasteType {
    return Intl.message(
      'Hazardous',
      name: 'hazardousWasteType',
    );
  }

  String get batteryWasteType {
    return Intl.message(
      'Battery',
      name: 'batteryWasteType',
    );
  }

  String get appliancesWasteType {
    return Intl.message(
      'Appliances',
      name: 'appliancesWasteType',
    );
  }

  String get lightBulbWasteType {
    return Intl.message(
      'LightBulb',
      name: 'lightBulbWasteType',
    );
  }

  String get otherWasteType {
    return Intl.message(
      'Other',
      name: 'otherWasteType',
    );
  }

  String get wasteTypesTitle {
    return Intl.message(
      'Waste Types',
      name: 'wasteTypesTitle',
    );
  }

  String get helpUsScreenTitle {
    return Intl.message(
      'Help Us',
      name: 'helpUsScreenTitle',
    );
  }

  String get helpUsScreenText {
    return Intl.message(
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Eget felis eget nunc lobortis mattis aliquam faucibus. Elementum nibh tellus molestie nunc non blandit massa enim nec. Massa placerat duis ultricies lacus sed turpis tincidunt id. Elit ut aliquam purus sit. Adipiscing elit ut aliquam purus sit. Vel eros donec ac odio tempor. Pulvinar sapien et ligula ullamcorper malesuada proin libero. Dui accumsan sit amet nulla facilisi morbi tempus iaculis urna. Purus in massa tempor nec feugiat nisl pretium fusce. Commodo ullamcorper a lacus vestibulum sed arcu. Nisi lacus sed viverra tellus in hac.',
      name: 'helpUsScreenText',
    );
  }

  String get noArticlesText {
    return Intl.message(
      'No Articles',
      name: 'noArticlesText',
    );
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return [
      'en',
      'ru',
    ].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) {
    return AppLocalizations.load(locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) {
    return false;
  }
}
