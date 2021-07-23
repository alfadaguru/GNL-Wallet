import 'package:cryptocurrency_flutter/model/search_model.dart';
import 'package:mobx/mobx.dart';

part 'CoinStore.g.dart';

class CoinStore = CoinStoreBase with _$CoinStore;

abstract class CoinStoreBase with Store {
  @observable
  ObservableList<Coin> favoriteCoins = ObservableList();

  @action
  Future addFavoriteCoins(Coin value, {bool isClear = false}) async {
    if (isClear) {
      favoriteCoins.clear();
    }
    favoriteCoins.add(value);
  }

  @action
  Future removeFavoriteCoins(Coin value) async {
    return favoriteCoins.removeAt(favoriteCoins.indexWhere((element) => value.id == element.id));
  }

  Future get clearFavoriteCoins async => favoriteCoins.clear();
}
