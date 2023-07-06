import 'package:intl/intl.dart';

extension HumanDate on DateTime {
  String toHumanDateTime() {
    String formattedDate = DateFormat('dd/MM/yyyy').format(this);
    String formattedTime = DateFormat('HH:mm:ss').format(this);
    return '$formattedDate | $formattedTime';
  }

  String toHumanDate() {
    return DateFormat('dd/MM/yyyy').format(this);
  }
}
