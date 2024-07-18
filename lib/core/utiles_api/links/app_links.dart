// baserUrl https://student.valuxapps.com/api/

abstract class AppLinks {
  static const String baserUrl = 'https://student.valuxapps.com/api/';

  static const lang = 'lang';
  static const token = 'Authorization';

  static const Map<String, dynamic>? baserHeader = {
    'Content-Type': 'application/json',
  };
}
