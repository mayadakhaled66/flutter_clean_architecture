import 'package:flutter/material.dart';

enum LocaleKeys {
  hello("hello"),
  helloWorld("hello-world");

  const LocaleKeys(this.key);
  final String key;
}

enum LocaleTypes {
  english(Locale("en")),
  arabic(Locale("ar"));

  const LocaleTypes(this.value);
  final Locale value;
}

abstract class AppLocale{
  LocaleTypes getCurrentLocalName ();
  Map<String,String> getCurrentLocalList ();
}