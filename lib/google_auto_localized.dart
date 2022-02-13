library google_auto_localized;
import 'package:flutter/material.dart';
import 'package:google_auto_localized/google_auto_localized.dart';
export 'package:easy_localization/src/easy_localization_app.dart';
export 'package:easy_localization/src/asset_loader.dart';
export 'package:easy_localization/src/public.dart';
export 'package:easy_localization/src/public_ext.dart';
export 'package:intl/intl.dart';

class GoogleAutoLocalized extends StatefulWidget {
  final List<String> languages;
  final String directoryPath;
  final String defaultLanguage;
  final Widget child;

  static Future<void> ensureInitialized() async =>
      await EasyLocalization.ensureInitialized();


  const GoogleAutoLocalized({Key key, this.languages, this.directoryPath, this.defaultLanguage, this.child}) : super(key: key);
  @override
  _GoogleAutoLocalizedState createState() => _GoogleAutoLocalizedState();
}

class _GoogleAutoLocalizedState extends State<GoogleAutoLocalized> {
  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
        supportedLocales: widget.languages.map((e) => Locale(e)).toList(),
        path: widget.directoryPath,
        fallbackLocale: Locale(widget.defaultLanguage),
        child: widget.child
    );
  }
}