import 'package:intl/intl.dart';

/// Date Time Extension
///
extension DateFunc on int {
  /// Dateformate(dd MMM yy)
  /// ===
  String get formatDateddMMMyy {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(this);
    final outputFormat = DateFormat("dd MMM yy hh:mm a");
    return outputFormat.format(dateTime);
  }
}
