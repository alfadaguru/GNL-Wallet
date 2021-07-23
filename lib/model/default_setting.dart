class DefaultSetting {
  String? name;
  String? imageLink;

  DefaultSetting({
    this.name,
    this.imageLink,
  });

  static List<DefaultSetting> get getChartMarketDefaultType {
    List<DefaultSetting> list = [];
    list.add(DefaultSetting(name: "Prices"));
    list.add(DefaultSetting(name: "Market Caps"));
    list.add(DefaultSetting(name: "Total volumes"));
    return list;
  }
}
