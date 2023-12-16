import 'package:flutter_clean_archticture/core/localization/supported_locales/locales.dart';

class ArabicLocal implements AppLocale{
  static  final Map<String,String> _locales =  {
    LocaleKeys.hello.key :"مرحبا",
    LocaleKeys.helloWorld.key: " مرحبا x"
  };

  @override
  Map<String, String> getCurrentLocalList() {
    return _locales;
  }

  @override
  LocaleTypes getCurrentLocalName() {
    return LocaleTypes.arabic;
  }
}