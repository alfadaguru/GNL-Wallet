import 'package:cryptocurrency_flutter/model/currency_model.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:nb_utils/nb_utils.dart';

class AppConstant {
  static const appName = "GNL Wallet";
  static const defaultLanguage = 'en';
  static const baseUrl = 'https://api.coingecko.com/api/v3/';
  static const perPage = 50;
  static const defaultGraphColor = Colors.orange;
  static const oneSignalAppID = '22144c24-fbd0-4ed8-807e-6ddf5b7fba04';
  static CurrencyModel defaultCurrency = CurrencyModel(name: 'India', cc: 'inr', symbol: '₹');

  static List<Color> gradientColor = [Colors.green, Colors.red, Colors.blue, Colors.orange, Colors.yellowAccent, Colors.deepPurple, Colors.lightGreen];
}

class Admob {
  static String mAdMobBannerId = BannerAd.testAdUnitId;
  static String mAdMobInterstitialId = InterstitialAd.testAdUnitId;
}

class SharedPreferenceKeys {
  static const DASHBOARD_DATA = "DASHBOARD_DATA";
  static const COIN_LIST = "COIN_LIST";
  static const TRENDING_DATA = "TRENDING_DATA";
  static const SELECTED_CURRENCY_INDEX = "SELECTED_CURRENCY_INDEX";
  static const SELECTED_CURRENCY = "SELECTED_CURRENCY";
  static const IS_FIRST = "IS_FIRST";
  static const CHART_DATA = "CHART_DATA";
  static const MARKET_TYPE_SELECTED_INDEX = "MARKET_TYPE_SELECTED_INDEX";
}

class AppImages {
  static const walkThroughBackgroundImage = "images/app_images/walkthrough_background.jpg";
  static const gifWithName = "images/app_images/text_loader.gif";
}

class AppURLs {
  static const appDescription =
      "The future is crypto currency exchange and we have build CryptoCoins Tracker Flutter App for digital currency investors, traders, and cryptocurrency experts. With a handful of features that can enhance your users’ crypto experience and even add value to their portfolio, CryptoCoins can keep you up-to-date with the latest trends and information. CryptoCoins is ideally designed and developed for lending platform providers to track change in rates. Keep a track of rates of coins in real-time with this Flutter app. You can find top trending coins of the day, search coins, turn to the latest news on crypto currency, review charts on your screen and get an overview of the digital currency market and listed coins at your comfort and ease with CryptoCoins App. With a multi-language support, you can create the most outstanding personalize user experience. CryptoCoins also gives its users ability to make decision at and cash out when the time is best.So, if you are a crypto currency trader, then CryptoCoins is the app every trader should have on their smartphone";
  static const copyRight = 'copyright @2021 Green Life Energy';
  static const packageName = "com.iqonic.cryptocoin";
  static const termsAndConditionURL = 'gnl.energy';
  static const supportURL = 'https://gnl.energy';
  static const codeCanyonURL = '';
  static const appShareURL = '$playStoreBaseURL$packageName';
  static const mailto = 'hello@gnl.energy';
  static const documentation = 'https://wordpress.iqonic.design/docs/product/cryptocoins/';
}

//region All enums
enum ChartMarketType { PRICES, MARKET_CAPS, TOTAL_VOLUMES }
//end region
