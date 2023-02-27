// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Conning Tower`
  String get Title {
    return Intl.message(
      'Conning Tower',
      name: 'Title',
      desc: '',
      args: [],
    );
  }

  /// `a cross-platform KanColle browser.`
  String get TitleDescription {
    return Intl.message(
      'a cross-platform KanColle browser.',
      name: 'TitleDescription',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get Description {
    return Intl.message(
      '',
      name: 'Description',
      desc: '',
      args: [],
    );
  }

  /// `for iOS/iPadOS`
  String get DownloadIPA {
    return Intl.message(
      'for iOS/iPadOS',
      name: 'DownloadIPA',
      desc: '',
      args: [],
    );
  }

  /// `Download on the App Store`
  String get DownloadAppStore {
    return Intl.message(
      'Download on the App Store',
      name: 'DownloadAppStore',
      desc: '',
      args: [],
    );
  }

  /// `for Android`
  String get DownloadAPK {
    return Intl.message(
      'for Android',
      name: 'DownloadAPK',
      desc: '',
      args: [],
    );
  }

  /// `Download on the Google Play Store`
  String get DownloadPlayStore {
    return Intl.message(
      'Download on the Google Play Store',
      name: 'DownloadPlayStore',
      desc: '',
      args: [],
    );
  }

  /// `Coming Soon`
  String get ComingSoon {
    return Intl.message(
      'Coming Soon',
      name: 'ComingSoon',
      desc: '',
      args: [],
    );
  }

  /// `Apple®, iPad®, iPadOS®, App Store® and iPhone® are trademarks of Apple Inc., registered in the U.S. and other countries and regions.\nConningTower icon designed by Andy Chu Copyright © 2023 ConningTower All rights reserved.`
  String get Copyright {
    return Intl.message(
      'Apple®, iPad®, iPadOS®, App Store® and iPhone® are trademarks of Apple Inc., registered in the U.S. and other countries and regions.\nConningTower icon designed by Andy Chu Copyright © 2023 ConningTower All rights reserved.',
      name: 'Copyright',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'zh', countryCode: 'CN'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
