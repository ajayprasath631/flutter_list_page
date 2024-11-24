class DateUtilsFormatter {
  static int calculateYearsAgo(DateTime updatedDateTime) {
    final DateTime now = DateTime.now();

    int yearsDifference = now.year - updatedDateTime.year;

    if (now.month < updatedDateTime.month ||
        (now.month == updatedDateTime.month && now.day < updatedDateTime.day)) {
      yearsDifference--;
    }
    return yearsDifference;
  }
}
