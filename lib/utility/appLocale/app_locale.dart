// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_locale.g.dart';

@riverpod
class AppLocale extends _$AppLocale {
  //AppLocale() : super(const Locale('en'));
  Locale _locale = const Locale('en');

  Locale get locale => _locale;

  set locale(Locale newLocale) {
    _locale = newLocale;
    state = newLocale;
  }

  @override
  Locale build() {
    return const Locale('en');
  }
}
