import 'dart:async';
import 'dart:isolate';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_list_page/features/myapp/my_app.dart';
import 'package:flutter_list_page/utility/flavor_config.dart';
import 'package:flutter_list_page/utility/observer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      try {
        await Firebase.initializeApp();
        await _envConfig();
        await _initializeFirebaseCrashlytics();
        runApp(
          ProviderScope(
            observers: [
              MyObserver(),
            ],
            child: const MyApp(),
          ),
        );
      } catch (e) {
        debugPrint("Error on start up $e");
      }
    },
    (e, s) => FirebaseCrashlytics.instance.recordError(e, s),
  );
}

Future<void> _envConfig() async {
  const env = EnvConfig.flavor;
  debugPrint('Running for flavor: $env');
  await dotenv.load(fileName: 'env/.env.$env');
}

Future<void> _initializeFirebaseCrashlytics() async {
  // Pass all uncaught errors to Crashlytics.
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(kReleaseMode);
  PlatformDispatcher.instance.onError = (error, stack) {
    // If you wish to record a "non-fatal" exception, please remove the "fatal" parameter.
    FirebaseCrashlytics.instance.recordError(error, stack);
    return true;
  };
  Isolate.current.addErrorListener(
    RawReceivePort((pair) async {
      final List<dynamic> errorAndStacktrace = pair;
      await FirebaseCrashlytics.instance.recordError(
        errorAndStacktrace.first,
        errorAndStacktrace.last,
        fatal: true,
      );
    }).sendPort,
  );
}
