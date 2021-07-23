import 'dart:convert';

import 'package:cryptocurrency_flutter/model/coin_detail_model.dart';
import 'package:cryptocurrency_flutter/model/currency_model.dart';
import 'package:cryptocurrency_flutter/utils/app_constant.dart';
import 'package:nb_utils/nb_utils.dart';

num? getPercentageValueInCurrency(PriceChange24hInCurrency percentage1hInCurrency) {
  CurrencyModel selectedCurrency = CurrencyModel.fromJson(jsonDecode(getStringAsync(SharedPreferenceKeys.SELECTED_CURRENCY)));
  Map<String, dynamic> json = percentage1hInCurrency.toJson();

  if (json.keys.toList().any((element) => selectedCurrency.cc == element)) {
    return json.values.toList()[json.keys.toList().indexOf(selectedCurrency.cc.toString())];
  }
}

String? getDates(AthDate dates) {
  CurrencyModel selectedCurrency = CurrencyModel.fromJson(jsonDecode(getStringAsync(SharedPreferenceKeys.SELECTED_CURRENCY)));
  Map<String, dynamic> json = dates.toJson();

  if (json.keys.toList().any((element) => selectedCurrency.cc == element)) {
    return json.values.toList()[json.keys.toList().indexOf(selectedCurrency.cc.toString())];
  }
}
