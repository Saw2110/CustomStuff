import 'package:timeago/timeago.dart' as time_ago;

extension TimeExtension on String {
  static String displayTimeAgoFromTimestamp(String dateString) {
    final month = int.parse(dateString.substring(0, 2));
    final day = int.parse(dateString.substring(3, 5));
    final year = int.parse(dateString.substring(6, 11));
    final hour = int.parse(dateString.substring(11, 13));
    final minute = int.parse(dateString.substring(14, 16));
    final second = int.parse(dateString.substring(17, 19));

    DateTime result = DateTime(year, month, day, hour, minute, second);

    return time_ago.format(result);
  }
}
