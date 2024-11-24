// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_list_page/features/author/data/model/author.dart';
import 'package:flutter_list_page/features/author/presentation/author_page.dart';
import 'package:flutter_list_page/features/author/presentation/authot_details.dart';
import 'package:flutter_list_page/features/myapp/my_app.dart';

class MainAppRoute {
  static const String myApp = "MY_APP";
  static const String authorList = "Author_List";
  static const String authorDetail = "Author_Detail";

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case myApp:
        return MaterialPageRoute(builder: (_) => const MyApp());
      case authorList:
        return MaterialPageRoute(
          builder: (_) => const AuthorListPage(),
        );
      case authorDetail:
        final args = settings.arguments as Map<String, dynamic>?;
        final Message argMessageStatus = args?["message"] as Message;
        return MaterialPageRoute(
          builder: (_) => AuthorDetail(message: argMessageStatus),
        );
      default:
        return defaultRoute(settings);
    }
  }

  static MaterialPageRoute<dynamic> defaultRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        body: Center(
          child: Text('Page not found ${settings.name}'),
        ),
      ),
    );
  }
}
