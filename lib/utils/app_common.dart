import 'package:cryptocurrency_flutter/main.dart';
import 'package:cryptocurrency_flutter/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:url_launcher/url_launcher.dart';

extension SExt on String {
  String get translate => appLocalizations!.translate(this);
}

class AppCommon {
  /// Common InputDecoration
  static InputDecoration inputDecoration(String? title) {
    return InputDecoration(
      hintText: title.validate(),
      hintStyle: primaryTextStyle(),
      filled: true,
      fillColor: cardColor,
      border: OutlineInputBorder(borderRadius: radius(20), borderSide: BorderSide(color: secondaryColor)),
      contentPadding: EdgeInsets.symmetric(horizontal: 16),
    );
  }

  static Future<void> launchUrl(String url, {bool forceWebView = false}) async {
    await launch(url, forceWebView: forceWebView, enableJavaScript: true, statusBarBrightness: Brightness.light, webOnlyWindowName: "News").catchError((e) {
      toast('Invalid URL: $url');
    });
  }

  static String parseHtmlString(String? htmlString) {
    return parse(parse(htmlString).body!.text).documentElement!.text;
  }
}

//region Extensions
extension numberFormat on num {
  String get amountPrefix {
    if (this > 999 && this < 99999) {
      return "${(this / 1000).toStringAsFixed(1)} K";
    } else if (this > 99999 && this < 999999) {
      return "${(this / 1000).toStringAsFixed(0)} K";
    } else if (this > 999999 && this < 999999999) {
      return "${(this / 1000000).toStringAsFixed(2)} M";
    } else if (this > 999999999) {
      return "${(this / 1000000000).toStringAsFixed(2)} B";
    } else {
      return this.toString();
    }
  }

  Color get getAmountForColor {
    if (this.isNegative) {
      return dangerColor;
    } else {
      return successColor;
    }
  }
}

extension stringExt on String {
  String get getFormattedDate {
    return DateFormat('dd-MMM-yyy').format(DateTime.parse(this));
  }

  Color get getExchangeColor {
    if (this == "green") {
      return Colors.green;
    } else if (this == "red") {
      return Colors.red;
    } else if (this == "yellow") {
      return Colors.yellow;
    } else if (this == "gray") {
      return Colors.grey;
    } else {
      return Colors.transparent;
    }
  }

  String get getExchangeStatus {
    if (this == "green") {
      return 'Trust score is Good. we estimate that this exchange pair has a good liquidity.';
    } else if (this == "red") {
      return 'Trust score is Low. we estimate that this exchange pair has a low liquidity.';
    } else if (this == "yellow") {
      return 'Trust score is Fair. we estimate that this exchange pair has a fair liquidity.';
    } else if (this == "gray") {
      return 'Recently added, score may fluctuate as mor data is collected.';
    } else {
      return 'Trust score is unknown. we do not have sufficient order book data for this exchange pair.';
    }
  }
}
//endregion

String twoDigits(int n) {
  if (n >= 10) return '$n';
  return '0$n';
}

String formatBySeconds(Duration duration) => twoDigits(duration.inSeconds.remainder(60));

String formatByMinutes(Duration duration) {
  String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
  return '$twoDigitMinutes:${formatBySeconds(duration)}';
}

String formatByHours(Duration duration) {
  return '${twoDigits(duration.inHours)}:${formatByMinutes(duration)}';
}
