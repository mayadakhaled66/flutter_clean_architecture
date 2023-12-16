import 'package:flutter/material.dart';
import 'package:flutter_clean_archticture/core/localization/app_localizations.dart';
import 'package:flutter_clean_archticture/core/localization/supported_locales/locales.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key, required this.title});
  final String title;
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //AppLocalizations.translateWithNamedArgs(LocaleKeys.helloWorld,{"x":"mayada"})
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            DropdownButton<LocaleTypes>(
              value: AppLocalizations.locale, //.getCurrentLocale(),
              items: const [
                DropdownMenuItem(
                  value: LocaleTypes.english,
                  child: Text("English"),
                ),
                DropdownMenuItem(
                  value: LocaleTypes.arabic,
                  child: Text("arabic"),
                ),
              ],
              onChanged: (LocaleTypes? value) async {
                if (value != null) {

                  setState(() {
                    AppLocalizations.setLocale(value);
                  });

                  AppLocalizations.translateWithNamedArgs(LocaleKeys.helloWorld,{"x":"world"});
                  AppLocalizations.translate(LocaleKeys.hello);

                  print(AppLocalizations.locale.value.languageCode);
                  // Navigator.pushNamedAndRemoveUntil(context,'/',(_) => false);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
