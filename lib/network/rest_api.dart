import 'dart:convert';

import 'package:cryptocurrency_flutter/model/coin_chart_model.dart';
import 'package:cryptocurrency_flutter/model/coin_detail_model.dart';
import 'package:cryptocurrency_flutter/model/coin_list_model.dart';
import 'package:cryptocurrency_flutter/model/currency_model.dart';
import 'package:cryptocurrency_flutter/model/dashboard_model.dart';
import 'package:cryptocurrency_flutter/model/news_response.dart';
import 'package:cryptocurrency_flutter/model/search_model.dart';
import 'package:cryptocurrency_flutter/model/trending_model.dart';
import 'package:cryptocurrency_flutter/network/network_utils.dart';
import 'package:cryptocurrency_flutter/utils/app_constant.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';

Future<List<CoinListModel>> getCoinList({String currency = 'usd', int page = 1}) async {
  Iterable iterable = await handleResponse(await buildHttpResponse('coins/markets?vs_currency=$currency&order=market_cap_desc&per_page=${AppConstant.perPage}&page=$page&sparkline=true&price_change_percentage=1h'));
  List<CoinListModel> list = [];

  iterable.forEach((element) {
    list.add(CoinListModel.fromJson(element));
  });

  await setValue(SharedPreferenceKeys.COIN_LIST, jsonEncode(list));

  return list;
}

Future<TrendingModel> get getTrendingList async {
  TrendingModel td = TrendingModel.fromJson(await handleResponse(await buildHttpResponse('/search/trending/')));
  await setValue(SharedPreferenceKeys.TRENDING_DATA, jsonEncode(td.toJson()));

  return td;
}

Future<CoinDetailModel> getCoinDetail({String? name}) async {
  CoinDetailModel cd = CoinDetailModel.fromJson(await handleResponse(await buildHttpResponse('coins/$name?localization=false&tickers=true&market_data=true&community_data=true&developer_data=true&sparkline=true')));
  return cd;
}

Future<CoinChartModel> getCoinMarket({String? name, int timeLimit = 1, String currency = ' usd'}) async {
  CoinChartModel cd = CoinChartModel.fromJson(await handleResponse(await buildHttpResponse('https://api.coingecko.com/api/v3/coins/$name/market_chart?vs_currency=$currency&days=$timeLimit')));

  return cd;
}

Future<List<CurrencyModel>> get getCurrencies async {
  Iterable iterable = jsonDecode(await rootBundle.loadString('assets/currency.json'));
  List<CurrencyModel> list = [];
  iterable.forEach((element) {
    list.add(CurrencyModel.fromJson(element));
  });
  return list;
}

Stream<DashboardResponse> dashboardStream({bool value = true, String currency = 'usd'}) async* {
  while (value) {
    await Future.delayed(Duration(milliseconds: 10000));
    DashboardResponse dashboardResponse = DashboardResponse();

    dashboardResponse.coinModel = await getCoinList(page: 1, currency: '$currency');
    dashboardResponse.trendingCoins = await getTrendingList;

    yield dashboardResponse;
  }
}

Future<SearchModel> get getCoinListForSearch async {
  return SearchModel.fromJson(await handleResponse(await buildHttpResponse('https://api.coingecko.com/api/v3/search/')));
}

Future<NewsResponse> getCryptoNews({int page = 1}) async {
  return NewsResponse.fromJson(await handleResponse(await buildHttpResponse('https://api.coingecko.com/api/v3/news?page=$page')));
}

//region CachedData
DashboardResponse? getCachedUserDashboardData() {
  DashboardResponse dashboardResponse = DashboardResponse();

  String coinList = getStringAsync(SharedPreferenceKeys.COIN_LIST);
  String trendingData = getStringAsync(SharedPreferenceKeys.TRENDING_DATA);

  List<CoinListModel> list = [];
  jsonDecode(coinList).forEach((element) {
    list.add(CoinListModel.fromJson(element));
  });

  dashboardResponse.coinModel = list;
  dashboardResponse.trendingCoins = TrendingModel.fromJson(jsonDecode(trendingData));
  return dashboardResponse;
}

//endregion
