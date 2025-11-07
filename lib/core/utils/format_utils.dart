
import 'package:intl/intl.dart';

class MyFormatUtils {
  static String formatCurrency(double amount) {
    return '\$${amount.toStringAsFixed(2)}';
  }

  static String convertTo12HourFormatWithAmPm(String time) {
    try {
      final cleanTime = time.trim();

      // Try HH:mm:ss
      try {
        final dt = DateFormat('HH:mm:ss').parseStrict(cleanTime);
        return DateFormat('h:mm a').format(dt);
      } catch (_) {}

      // Try HH:mm
      final dt = DateFormat('HH:mm').parseStrict(cleanTime);
      return DateFormat('h:mm a').format(dt);

    } catch (e) {
      return 'Invalid time';
    }
  }


  static String convertTo12HourFormat(String time) {
    final parts = time.split(':');
    final hour = int.parse(parts[0]);
    final minute = parts[1];

    // Convert to DateTime object
    final dateTime = DateTime(0, 1, 1, hour, int.parse(minute));

    // Format as 12-hour time (hh:mm without AM/PM)
    final formattedTime = DateFormat('h:mm').format(dateTime);

    return formattedTime;
  }
 static String getAmPm(String time) {
    final parts = time.split(':');
    final hour = int.parse(parts[0]);
    final minute = parts[1];

    // Convert to DateTime object
    final dateTime = DateTime(0, 1, 1, hour, int.parse(minute));

    // Get AM/PM only
    final amPm = DateFormat('a').format(dateTime);

    return amPm;
  }
}
