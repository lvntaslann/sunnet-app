class DateFormatter {
  static String formatDate(DateTime d) =>
      '${d.day.toString().padLeft(2, '0')} ${_monthName(d.month)} ${d.year}';

  static String _monthName(int month) {
    const months = [
      'Ocak',
      'Şubat',
      'Mart',
      'Nisan',
      'Mayıs',
      'Haziran',
      'Temmuz',
      'Ağustos',
      'Eylül',
      'Ekim',
      'Kasım',
      'Aralık',
    ];
    if (month < 1 || month > 12) return '';
    return months[month - 1];
  }
}
