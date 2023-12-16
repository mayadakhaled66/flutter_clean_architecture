import 'package:flutter/material.dart';
import 'package:flutter_clean_archticture/core/localization/supported_locales/ar_local.dart';
import 'package:flutter_clean_archticture/core/localization/supported_locales/locales.dart';

class LocalizationServices{

  ValueNotifier<AppLocale> currentLocale = ValueNotifier<AppLocale>(ArabicLocal());

  static final LocalizationServices _instance = LocalizationServices._internal();

  LocalizationServices._internal();

  factory LocalizationServices({AppLocale? currentLocale}) {
    if(currentLocale!=null){
        _instance.currentLocale.value = currentLocale;
    }
    return _instance;
  }


}