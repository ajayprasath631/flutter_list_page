// Package imports:
import 'package:flutter_list_page/utility/appLocale/app_locale.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:

part 'app_locale_provider.g.dart';

@Riverpod(keepAlive: true)
AppLocale appLocale(Ref ref) {
  return AppLocale();
}
