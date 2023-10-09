import 'package:intl/intl.dart';

class DataFormatter {
  static DataFormatter? _instance;
  DataFormatter._();
  factory DataFormatter() => _instance ??= DataFormatter._();

  String formatDateDMMMYYYY(DateTime dateTime) =>
      DateFormat('d MMM, yyyy').format(dateTime);
}
