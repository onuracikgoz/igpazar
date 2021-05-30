// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'services.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ServicesFromNetworkStore on ServicesFromNetworkBase, Store {
  final _$_shopListAtom = Atom(name: 'ServicesFromNetworkBase._shopList');

  @override
  ObservableList<Shop> get _shopList {
    _$_shopListAtom.reportRead();
    return super._shopList;
  }

  @override
  set _shopList(ObservableList<Shop> value) {
    _$_shopListAtom.reportWrite(value, super._shopList, () {
      super._shopList = value;
    });
  }

  final _$_shopAtom = Atom(name: 'ServicesFromNetworkBase._shop');

  @override
  Shop get _shop {
    _$_shopAtom.reportRead();
    return super._shop;
  }

  @override
  set _shop(Shop value) {
    _$_shopAtom.reportWrite(value, super._shop, () {
      super._shop = value;
    });
  }

  final _$_discoveryListAtom =
      Atom(name: 'ServicesFromNetworkBase._discoveryList');

  @override
  ObservableList<Discovery> get _discoveryList {
    _$_discoveryListAtom.reportRead();
    return super._discoveryList;
  }

  @override
  set _discoveryList(ObservableList<Discovery> value) {
    _$_discoveryListAtom.reportWrite(value, super._discoveryList, () {
      super._discoveryList = value;
    });
  }

  final _$getShopsAsyncAction = AsyncAction('ServicesFromNetworkBase.getShops');

  @override
  Future<List<Shop>> getShops(dynamic context) {
    return _$getShopsAsyncAction.run(() => super.getShops(context));
  }

  final _$ServicesFromNetworkBaseActionController =
      ActionController(name: 'ServicesFromNetworkBase');

  @override
  dynamic getShopById(dynamic id) {
    final _$actionInfo = _$ServicesFromNetworkBaseActionController.startAction(
        name: 'ServicesFromNetworkBase.getShopById');
    try {
      return super.getShopById(id);
    } finally {
      _$ServicesFromNetworkBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
