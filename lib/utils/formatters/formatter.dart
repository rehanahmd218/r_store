import 'package:intl/intl.dart';

class RFormatters {
  static String formatDate(DateTime? date) {
    final safeDate = date ?? DateTime.now();
    return DateFormat('dd/MM/yyyy').format(safeDate);
  }

  static String formatCurrency(double amount) {
    return NumberFormat.currency(locale: 'en_US', symbol: '\$').format(amount);
  } // Customize the currency locate and symbol as needed

  static String formatPhoneNumber(String phoneNumber) {
    // Assyming a 10 - Digit US phone number format (123) 456-7890
    if (phoneNumber.length == 10) {
      return '(${phoneNumber.substring(0, 3)}) ${phoneNumber.substring(3, 6)}-${phoneNumber.substring(6)}';
    } else if (phoneNumber.length == 11 && phoneNumber.startsWith('1')) {
      // Handle US numbers with country code
      return '+1 (${phoneNumber.substring(1, 4)}) ${phoneNumber.substring(4, 7)}-${phoneNumber.substring(7)}';
    } else {
      return phoneNumber; // Return as is if it doesn't match expected formats
    }
  }


  static String internationalFormatPhoneNumber(String phoneNumber) {
    // Assuming a basic international format
    if (phoneNumber.startsWith('+')) {
      return phoneNumber; // Already in international format
    } else if (phoneNumber.length == 10) {
      return '+1 ${formatPhoneNumber(phoneNumber)}'; // US number
    } else {
      return phoneNumber; // Return as is if it doesn't match expected formats
    }
  }
}
