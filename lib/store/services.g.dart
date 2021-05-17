// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'services.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ServicesFromNetworkStore on ServicesFromNetworkBase, Store {
  final _$_shopListAtom = Atom(name: 'ServicesFromNetworkBase._shopList');

  @override
  List<Shop> get _shopList {
    _$_shopListAtom.reportRead();
    return super._shopList;
  }

  @override
  set _shopList(List<Shop> value) {
    _$_shopListAtom.reportWrite(value, super._shopList, () {
      super._shopList = value;
    });
  }

  final _$_discoveryListAtom =
      Atom(name: 'ServicesFromNetworkBase._discoveryList');

  @override
  List<Discovery> get _discoveryList {
    _$_discoveryListAtom.reportRead();
    return super._discoveryList;
  }

  @override
  set _discoveryList(List<Discovery> value) {
    _$_discoveryListAtom.reportWrite(value, super._discoveryList, () {
      super._discoveryList = value;
    });
  }

  final _$getShopsAsyncAction = AsyncAction('ServicesFromNetworkBase.getShops');

  @override
  Future<List<Shop>> getShops(dynamic context) {
    return _$getShopsAsyncAction.run(() => super.getShops(context));
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
