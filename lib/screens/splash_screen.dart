import 'package:cryptocurrency_flutter/main.dart';
import 'package:cryptocurrency_flutter/network/local_db/sqflite_methods.dart';
import 'package:cryptocurrency_flutter/screens/create/create_wallet.dart';
import 'package:cryptocurrency_flutter/screens/home_screen.dart';
import 'package:cryptocurrency_flutter/screens/walkthrough_screen.dart';
import 'package:cryptocurrency_flutter/utils/app_colors.dart';
import 'package:cryptocurrency_flutter/utils/app_constant.dart';
import 'package:cryptocurrency_flutter/utils/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isFirst = true;
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    setStatusBarColor(primaryColor);

    await 2.seconds.delay.then((value) => appLocalizations = AppLocalizations.of(context));
    localDbInstance = await SqliteMethods.initInstance();

    if (getBoolAsync(SharedPreferenceKeys.IS_FIRST, defaultValue: true)) {
      1.seconds.delay.then((value) => WalkThroughScreen().launch(context, pageRouteAnimation: PageRouteAnimation.Fade, isNewTask: true));
    } else {
      1.seconds.delay.then((value) => CreateWalletScreen().launch(context, pageRouteAnimation: PageRouteAnimation.Fade, isNewTask: true));
     // 1.seconds.delay.then((value) => HomeScreen().launch(context, pageRouteAnimation: PageRouteAnimation.Fade, isNewTask: true));
    }
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: context.width(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("images/app_images/text_loader.gif"),
            ],
          ),
        ),
      ),
    );
  }
}
