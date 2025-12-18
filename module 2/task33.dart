import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async
{
  // locale data
  await initializeDateFormatting();

  DateTime now = DateTime.now();

  // Date Format
  String formattedDateUS = DateFormat.yMMMMd('en_US').format(now);
  print("US Date Format: $formattedDateUS");

  String formattedDateFR = DateFormat.yMMMMd('fr_FR').format(now);
  print("French Date Format: $formattedDateFR");

  // Number Format
  double amount = 1234567.89;

  NumberFormat usFormat = NumberFormat.currency(locale: 'en_US', symbol: '\$');
  print("US Currency: ${usFormat.format(amount)}");

  NumberFormat deFormat = NumberFormat.currency(locale: 'de_DE', symbol: '€');
  print("German Currency: ${deFormat.format(amount)}");
}