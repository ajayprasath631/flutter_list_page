import 'app_localization.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationEn extends AppLocalization {
  AppLocalizationEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'List Page';

  @override
  String get search => 'Search...';

  @override
  String get searchResults => 'Search Results';

  @override
  String get delete => 'Delete';

  @override
  String get details => 'Details';

  @override
  String get deletedSuccessfully => 'Deleted Successfully';

  @override
  String get cancel => 'Cancel';

  @override
  String founds(int Count) {
    return '$Count founds';
  }

  @override
  String get deleteThisAuthor => 'Delete this author?';

  @override
  String get noMoreDataFoundText => 'No more Data found';

  @override
  String get loading => 'Loading...';

  @override
  String get noPostsFoundText => 'No Data found';

  @override
  String yearsAgo(int year) {
    return '$year years ago';
  }
}
