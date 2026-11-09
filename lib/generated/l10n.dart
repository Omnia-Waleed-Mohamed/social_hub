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

  /// `Welcome Back!`
  String get loginTitle {
    return Intl.message(
      'Welcome Back!',
      name: 'loginTitle',
      desc: '',
      args: [],
    );
  }

  /// `Sign in to connect with your community.`
  String get loginSubtitle {
    return Intl.message(
      'Sign in to connect with your community.',
      name: 'loginSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get username {
    return Intl.message(
      'Username',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `Enter your username`
  String get usernameHint {
    return Intl.message(
      'Enter your username',
      name: 'usernameHint',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your username`
  String get usernameRequired {
    return Intl.message(
      'Please enter your username',
      name: 'usernameRequired',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get passwordHint {
    return Intl.message(
      'Enter your password',
      name: 'passwordHint',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your password`
  String get passwordRequired {
    return Intl.message(
      'Please enter your password',
      name: 'passwordRequired',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signIn {
    return Intl.message(
      'Sign In',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `Invalid username or password`
  String get invalidCredentials {
    return Intl.message(
      'Invalid username or password',
      name: 'invalidCredentials',
      desc: '',
      args: [],
    );
  }

  /// `No internet connection. Please check your Wi‑Fi or mobile data and try again.`
  String get noInternet {
    return Intl.message(
      'No internet connection. Please check your Wi‑Fi or mobile data and try again.',
      name: 'noInternet',
      desc: '',
      args: [],
    );
  }

  /// `SSL connection problem. The network or certificate is blocking secure access.`
  String get sslHandshake {
    return Intl.message(
      'SSL connection problem. The network or certificate is blocking secure access.',
      name: 'sslHandshake',
      desc: '',
      args: [],
    );
  }

  /// `Request timed out. Please check your internet connection and try again.`
  String get timeout {
    return Intl.message(
      'Request timed out. Please check your internet connection and try again.',
      name: 'timeout',
      desc: '',
      args: [],
    );
  }

  /// `Please check your internet connection`
  String get networkError {
    return Intl.message(
      'Please check your internet connection',
      name: 'networkError',
      desc: '',
      args: [],
    );
  }

  /// `Server error. Please try again later`
  String get serverError {
    return Intl.message(
      'Server error. Please try again later',
      name: 'serverError',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong. Please try again`
  String get unexpectedError {
    return Intl.message(
      'Something went wrong. Please try again',
      name: 'unexpectedError',
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
      Locale.fromSubtags(languageCode: 'ar'),
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
