import 'package:common/ui/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_list_page/features/author/presentation/author_page.dart';
import 'package:flutter_list_page/utility/appLocale/app_locale_provider.dart';
import 'package:flutter_list_page/utility/routes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localization/generated/app_localization.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Author List',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      scaffoldMessengerKey: CustomSnackBar.rootScaffoldMessengerKey,
      home: const AuthorListPage(),
      locale: ref.watch(appLocaleProvider).locale,
      localizationsDelegates: AppLocalization.localizationsDelegates,
      supportedLocales: AppLocalization.supportedLocales,
      onGenerateRoute: MainAppRoute.onGenerateRoute,
    );
  }
}
