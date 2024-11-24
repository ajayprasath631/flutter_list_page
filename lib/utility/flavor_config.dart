// Package imports:
import 'package:flutter_dotenv/flutter_dotenv.dart';

// 🌎 Project imports:
// ignore: constant_identifier_names
enum AppEnv { Dev, Prod }

class EnvConfig {
  static const String flavor =
      String.fromEnvironment('flavor', defaultValue: 'Dev');

  static AppEnv env = FlavorUtil.getAppEnv(
    const String.fromEnvironment('flavor', defaultValue: 'Dev'),
  );

  static String applicationName =
      dotenv.get('APPLICATION_NAME', fallback: 'List Page');

  static String baseUrl = dotenv.get('BASE_URL', fallback: '');
}

class FlavorUtil {
  static AppEnv getAppEnv(String env) {
    switch (env) {
      case 'Dev':
        return AppEnv.Dev;
      case 'Prod':
        return AppEnv.Prod;
      default:
        return AppEnv.Dev;
    }
  }
}
