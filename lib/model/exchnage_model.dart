class ExchangeModel {
  String? name;
  List<Ticker>? tickers;

  ExchangeModel({this.name, this.tickers});

  factory ExchangeModel.fromJson(Map<String, dynamic> json) {
    return ExchangeModel(
      name: json['name'],
      tickers: json['tickers'] != null ? (json['tickers'] as List).map((i) => Ticker.fromJson(i)).toList() : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.tickers != null) {
      data['tickers'] = this.tickers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Ticker {
  String? base;
  double? bid_ask_spread_percentage;
  String? coin_id;
  ConvertedLast? converted_last;
  ConvertedLast? converted_volume;
  bool? is_anomaly;
  bool? is_stale;
  double? last;
  String? last_fetch_at;
  String? last_traded_at;
  Market? market;
  String? target;
  String? target_coin_id;
  String? timestamp;
  String? token_info_url;
  String? trade_url;
  String? trust_score;
  double? volume;

  Ticker(
      {this.base,
      this.bid_ask_spread_percentage,
      this.coin_id,
      this.converted_last,
      this.converted_volume,
      this.is_anomaly,
      this.is_stale,
      this.last,
      this.last_fetch_at,
      this.last_traded_at,
      this.market,
      this.target,
      this.target_coin_id,
      this.timestamp,
      this.token_info_url,
      this.trade_url,
      this.trust_score,
      this.volume});

  factory Ticker.fromJson(Map<String, dynamic> json) {
    return Ticker(
        // base: json['base'],
        // bid_ask_spread_percentage: json['bid_ask_spread_percentage'],
        // coin_id: json['coin_id'],
        // converted_last: json['converted_last'] != null ? ConvertedLast.fromJson(json['converted_last']) : null,
        // converted_volume: json['converted_volume'] != null ? ConvertedLast.fromJson(json['converted_volume']) : null,
        // is_anomaly: json['is_anomaly'],
        // is_stale: json['is_stale'],
        // last: json['last'],
        // last_fetch_at: json['last_fetch_at'],
        // last_traded_at: json['last_traded_at'],
        // market: json['market'] != null ? Market.fromJson(json['market']) : null,
        // target: json['target'],
        // target_coin_id: json['target_coin_id'],
        // timestamp: json['timestamp'],
        // // token_info_url: json['token_info_url'],
        // trade_url: json['trade_url'],
        // trust_score: json['trust_score'],
        // volume: json['volume'],
        );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['base'] = this.base;
    data['bid_ask_spread_percentage'] = this.bid_ask_spread_percentage;
    data['coin_id'] = this.coin_id;
    data['is_anomaly'] = this.is_anomaly;
    data['is_stale'] = this.is_stale;
    data['last'] = this.last;
    data['last_fetch_at'] = this.last_fetch_at;
    data['last_traded_at'] = this.last_traded_at;
    data['target'] = this.target;
    data['target_coin_id'] = this.target_coin_id;
    data['timestamp'] = this.timestamp;
    data['token_info_url'] = this.token_info_url;
    data['trade_url'] = this.trade_url;
    data['trust_score'] = this.trust_score;
    data['volume'] = this.volume;
    if (this.converted_last != null) {
      data['converted_last'] = this.converted_last!.toJson();
    }
    if (this.converted_volume != null) {
      data['converted_volume'] = this.converted_volume!.toJson();
    }
    if (this.market != null) {
      data['market'] = this.market!.toJson();
    }
    return data;
  }
}

class Market {
  bool? has_trading_incentive;
  String? identifier;
  String? name;

  Market({this.has_trading_incentive, this.identifier, this.name});

  factory Market.fromJson(Map<String, dynamic> json) {
    return Market(
      has_trading_incentive: json['has_trading_incentive'],
      identifier: json['identifier'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['has_trading_incentive'] = this.has_trading_incentive;
    data['identifier'] = this.identifier;
    data['name'] = this.name;
    return data;
  }
}

class ConvertedLast {
  double? btc;
  double? eth;
  double? usd;

  ConvertedLast({this.btc, this.eth, this.usd});

  factory ConvertedLast.fromJson(Map<String, dynamic> json) {
    return ConvertedLast(
      btc: json['btc'],
      eth: json['eth'],
      usd: json['usd'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['btc'] = this.btc;
    data['eth'] = this.eth;
    data['usd'] = this.usd;
    return data;
  }
}
