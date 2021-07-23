// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CoinStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CoinStore on CoinStoreBase, Store {
  final _$favoriteCoinsAtom = Atom(name: 'CoinStoreBase.favoriteCoins');

  @override
  ObservableList<Coin> get favoriteCoins {
    _$favoriteCoinsAtom.reportRead();
    return super.favoriteCoins;
  }

  @override
  set favoriteCoins(ObservableList<Coin> value) {
    _$favoriteCoinsAtom.reportWrite(value, super.favoriteCoins, () {
      super.favoriteCoins = value;
    });
  }

  final _$addFavoriteCoinsAsyncAction =
      AsyncAction('CoinStoreBase.addFavoriteCoins');

  @override
  Future<dynamic> addFavoriteCoins(Coin value, {bool isClear = false}) {
    return _$addFavoriteCoinsAsyncAction
        .run(() => super.addFavoriteCoins(value, isClear: isClear));
  }

  final _$removeFavoriteCoinsAsyncAction =
      AsyncAction('CoinStoreBase.removeFavoriteCoins');

  @override
  Future<dynamic> removeFavoriteCoins(Coin value) {
    return _$removeFavoriteCoinsAsyncAction
        .run(() => super.removeFavoriteCoins(value));
  }

  @override
  String toString() {
    return '''
favoriteCoins: ${favoriteCoins}
    ''';
  }
}
