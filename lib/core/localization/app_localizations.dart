import 'package:flutter_clean_archticture/core/localization/supported_locales/ar_local.dart';
import 'package:flutter_clean_archticture/core/localization/supported_locales/en_local.dart';
import 'package:flutter_clean_archticture/core/localization/supported_locales/locales.dart';
import 'package:flutter_clean_archticture/core/localization/localization_service.dart';

abstract class BaseAppLocalizations {
  void setLocale(LocaleTypes localeType);
  LocaleTypes getCurrentLocale();
  String translate(LocaleKeys localKey);
  String translateWithNamedArgs(LocaleKeys localKey, Map<String, dynamic> namedArgument);
  String translateWithPlurals(LocaleKeys localKey);
}

class AppLocalizations  { // implements BaseAppLocalizations{

  static LocaleTypes get locale =>  LocalizationServices().currentLocale.value.getCurrentLocalName();

  static void setLocale(LocaleTypes localeType) {
    switch (localeType) {
      case LocaleTypes.arabic:
        LocalizationServices(currentLocale: ArabicLocal());
        break;
      case LocaleTypes.english:
        LocalizationServices(currentLocale: EnglishLocal());
        break;
    }
  }

  static String translate(LocaleKeys localKey) {
    return LocalizationServices().currentLocale.value.getCurrentLocalList()[localKey.key] ?? "";
  }

  static String translateWithNamedArgs(LocaleKeys localKey, Map<String, dynamic> namedArgument) {
    String keyTranslationValue =
        LocalizationServices().currentLocale.value.getCurrentLocalList()[localKey.key] ?? "";

    if (keyTranslationValue.isNotEmpty) {
      namedArgument.forEach((key, value) {
        keyTranslationValue = keyTranslationValue.replaceFirst(key, value);
      });
    }
    return keyTranslationValue;
  }

  static String translateWithPlurals(LocaleKeys localKey) {
    return "";
  }
}
