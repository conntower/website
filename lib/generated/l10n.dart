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

  /// `ConningTower Lite is a lightweight version of ConningTower for iOS. Runs more smoothly.`
  String get LiteDes1 {
    return Intl.message(
      'ConningTower Lite is a lightweight version of ConningTower for iOS. Runs more smoothly.',
      name: 'LiteDes1',
      desc: '',
      args: [],
    );
  }

  /// `ConningTower for iOS`
  String get TitleIOS {
    return Intl.message(
      'ConningTower for iOS',
      name: 'TitleIOS',
      desc: '',
      args: [],
    );
  }

  /// `ConningTower Lite`
  String get TitleLite {
    return Intl.message(
      'ConningTower Lite',
      name: 'TitleLite',
      desc: '',
      args: [],
    );
  }

  /// `ConningTower`
  String get Title {
    return Intl.message(
      'ConningTower',
      name: 'Title',
      desc: '',
      args: [],
    );
  }

  /// `a Cross-platform KanColle browser`
  String get TitleDescription {
    return Intl.message(
      'a Cross-platform KanColle browser',
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

  /// `IPA file for iOS/iPadOS`
  String get DownloadIPA {
    return Intl.message(
      'IPA file for iOS/iPadOS',
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

  /// `APK file for Android`
  String get DownloadAPK {
    return Intl.message(
      'APK file for Android',
      name: 'DownloadAPK',
      desc: '',
      args: [],
    );
  }

  /// `Download on Google Play Store`
  String get DownloadPlayStore {
    return Intl.message(
      'Download on Google Play Store',
      name: 'DownloadPlayStore',
      desc: '',
      args: [],
    );
  }

  /// `Use TestFlight test App`
  String get TestFlight {
    return Intl.message(
      'Use TestFlight test App',
      name: 'TestFlight',
      desc: '',
      args: [],
    );
  }

  /// `Latest Version`
  String get LatestVersion {
    return Intl.message(
      'Latest Version',
      name: 'LatestVersion',
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

  /// `View iOS version`
  String get GoToIOS {
    return Intl.message(
      'View iOS version',
      name: 'GoToIOS',
      desc: '',
      args: [],
    );
  }

  /// `ConningTower for iOS is a browser designed specifically for playing browser games. It lets you customize your screen and stay in landscape mode with desktop view at all times.`
  String get AppStoreDes1 {
    return Intl.message(
      'ConningTower for iOS is a browser designed specifically for playing browser games. It lets you customize your screen and stay in landscape mode with desktop view at all times.',
      name: 'AppStoreDes1',
      desc: '',
      args: [],
    );
  }

  /// `ConningTower iOS version is a closed-source branch independent of the ConningTower open-source project. The two are not equal. ConningTower iOS version is not a third-party client of KanColle, it is a universal web game browser. While the ConningTower iOS version will make special adaptations to some web page windows, this application is not aimed at any specific website.`
  String get AppStoreDes2 {
    return Intl.message(
      'ConningTower iOS version is a closed-source branch independent of the ConningTower open-source project. The two are not equal. ConningTower iOS version is not a third-party client of KanColle, it is a universal web game browser. While the ConningTower iOS version will make special adaptations to some web page windows, this application is not aimed at any specific website.',
      name: 'AppStoreDes2',
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

  /// `"艦隊これくしょん", "艦これ", and "艦娘" are trademarks of EXNOA LLC.`
  String get KCCopyright {
    return Intl.message(
      '"艦隊これくしょん", "艦これ", and "艦娘" are trademarks of EXNOA LLC.',
      name: 'KCCopyright',
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
      Locale.fromSubtags(languageCode: 'de'),
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'fr'),
      Locale.fromSubtags(languageCode: 'ja'),
      Locale.fromSubtags(languageCode: 'ko'),
      Locale.fromSubtags(languageCode: 'zh', countryCode: 'CN'),
      Locale.fromSubtags(languageCode: 'zh', countryCode: 'HK'),
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
