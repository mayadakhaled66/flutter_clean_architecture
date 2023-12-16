import 'locales.dart';

class EnglishLocal implements AppLocale{
  static final Map<String,String> _locales =  {
    LocaleKeys.hello.key :"Hello",
    LocaleKeys.helloWorld.key: "hello x"
  };

  @override
  Map<String, String> getCurrentLocalList() {
   return _locales;
  }

  @override
  LocaleTypes getCurrentLocalName() {
    return LocaleTypes.english;
  }
}