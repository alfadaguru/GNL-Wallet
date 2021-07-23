import 'dart:convert';

import 'package:cryptocurrency_flutter/model/currency_model.dart';
import 'package:cryptocurrency_flutter/screens/splash_screen.dart';
import 'package:cryptocurrency_flutter/store/AppStore.dart';
import 'package:cryptocurrency_flutter/store/ChartStore.dart';
import 'package:cryptocurrency_flutter/store/CoinStore.dart';
import 'package:cryptocurrency_flutter/utils/app_constant.dart';
import 'package:cryptocurrency_flutter/utils/app_functions.dart';
import 'package:cryptocurrency_flutter/utils/app_localizations.dart';
import 'package:cryptocurrency_flutter/utils/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:sqflite/sqflite.dart';

AppStore appStore = AppStore();
ChartStore chartStore = ChartStore();
CoinStore coinStore = CoinStore();
AppLocalizations? appLocalizations;
Database? localDbInstance;
int mAdShowCount = 0;

OneSignal oneSignal = OneSignal();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Function? originalOnError = FlutterError.onError;
  //
  // FlutterError.onError = (FlutterErrorDetails errorDetails) async {
  //   await FirebaseCrashlytics.instance.recordFlutterError(errorDetails);
  //   originalOnError!(errorDetails);
  // };
  defaultSetting;

  await initialize(aLocaleLanguageList: getAppLanguage);
  appStore.setLanguage(await getString(SELECTED_LANGUAGE_CODE, defaultValue: AppConstant.defaultLanguage));
  appStore.setSelectedCurrency(CurrencyModel.fromJson(jsonDecode(await getString(SharedPreferenceKeys.SELECTED_CURRENCY, defaultValue: jsonEncode(AppConstant.defaultCurrency)))));

  await oneSignal.setAppId(AppConstant.oneSignalAppID);

  OneSignal.shared.setNotificationWillShowInForegroundHandler((OSNotificationReceivedEvent? event) {
    return event?.complete(event.notification);
  });

  oneSignal.disablePush(false);
  oneSignal.consentGranted(true);
  oneSignal.requiresUserPrivacyConsent();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => MaterialApp(
        title: AppConstant.appName,
        debugShowCheckedModeBanner: false,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.dark,
        home: SplashScreen(),
        supportedLocales: LanguageDataModel.languageLocales(),
        localizationsDelegates: [AppLocalizations.delegate, GlobalMaterialLocalizations.delegate, GlobalWidgetsLocalizations.delegate],
        localeResolutionCallback: (locale, supportedLocales) => locale,
        locale: Locale(appStore.selectedLanguage!.languageCode.validate(value: AppConstant.defaultLanguage)),
        scrollBehavior: SBehavior(),
      ),
    );
  }
}
