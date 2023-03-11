import 'package:intl/intl.dart';

String getSvgIconPath() {
  String languageCode = Intl.getCurrentLocale();
  return 'assets/icons/$languageCode/Download_on_the_App_Store.svg';
}
