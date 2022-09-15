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

  /// `MCflutter demo`
  String get title {
    return Intl.message(
      'MCflutter demo',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `login`
  String get login {
    return Intl.message(
      'login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `theme`
  String get theme {
    return Intl.message(
      'theme',
      name: 'theme',
      desc: '',
      args: [],
    );
  }

  /// `language`
  String get language {
    return Intl.message(
      'language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `looput`
  String get logout {
    return Intl.message(
      'looput',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Is quit?`
  String get logoutTip {
    return Intl.message(
      'Is quit?',
      name: 'logoutTip',
      desc: '',
      args: [],
    );
  }

  /// `cancel`
  String get cancel {
    return Intl.message(
      'cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `yes`
  String get yes {
    return Intl.message(
      'yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `auto`
  String get auto {
    return Intl.message(
      'auto',
      name: 'auto',
      desc: '',
      args: [],
    );
  }

  /// `userName`
  String get userName {
    return Intl.message(
      'userName',
      name: 'userName',
      desc: '',
      args: [],
    );
  }

  /// `user not null`
  String get userNameRequired {
    return Intl.message(
      'user not null',
      name: 'userNameRequired',
      desc: '',
      args: [],
    );
  }

  /// `password`
  String get password {
    return Intl.message(
      'password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `pass not null`
  String get passwordRequired {
    return Intl.message(
      'pass not null',
      name: 'passwordRequired',
      desc: '',
      args: [],
    );
  }

  /// `userNameOrPasswordWrong`
  String get userNameOrPasswordWrong {
    return Intl.message(
      'userNameOrPasswordWrong',
      name: 'userNameOrPasswordWrong',
      desc: '',
      args: [],
    );
  }

  /// `noDescription`
  String get noDescription {
    return Intl.message(
      'noDescription',
      name: 'noDescription',
      desc: '',
      args: [],
    );
  }

  /// `homePage`
  String get homePage {
    return Intl.message(
      'homePage',
      name: 'homePage',
      desc: '',
      args: [],
    );
  }

  /// `mailList`
  String get mailList {
    return Intl.message(
      'mailList',
      name: 'mailList',
      desc: '',
      args: [],
    );
  }

  /// `me`
  String get me {
    return Intl.message(
      'me',
      name: 'me',
      desc: '',
      args: [],
    );
  }

  /// `joinMeeting`
  String get joinMeeting {
    return Intl.message(
      'joinMeeting',
      name: 'joinMeeting',
      desc: '',
      args: [],
    );
  }

  /// `startMeeting`
  String get startMeeting {
    return Intl.message(
      'startMeeting',
      name: 'startMeeting',
      desc: '',
      args: [],
    );
  }

  /// `orderMeeting`
  String get orderMeeting {
    return Intl.message(
      'orderMeeting',
      name: 'orderMeeting',
      desc: '',
      args: [],
    );
  }

  /// `huijian`
  String get huijian {
    return Intl.message(
      'huijian',
      name: 'huijian',
      desc: '',
      args: [],
    );
  }

  /// `meetingSchedule`
  String get meetingSchedule {
    return Intl.message(
      'meetingSchedule',
      name: 'meetingSchedule',
      desc: '',
      args: [],
    );
  }

  /// `meetingMinutes`
  String get meetingMinutes {
    return Intl.message(
      'meetingMinutes',
      name: 'meetingMinutes',
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
      Locale.fromSubtags(
          languageCode: 'zh', scriptCode: 'Hans', countryCode: 'CN'),
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
