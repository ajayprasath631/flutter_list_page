// Flutter imports:
import 'package:flutter/widgets.dart';

// Project imports:
import 'package:localization/generated/app_localization.dart';

// 🌎 Project imports:

extension AppIntl on BuildContext {
  AppLocalization get l10n => AppLocalization.of(this);
}
