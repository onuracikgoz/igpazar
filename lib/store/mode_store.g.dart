// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mode_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ModeStore on ModeStoreBase, Store {
  final _$_darkModeAtom = Atom(name: 'ModeStoreBase._darkMode');

  @override
  bool get _darkMode {
    _$_darkModeAtom.reportRead();
    return super._darkMode;
  }

  @override
  set _darkMode(bool value) {
    _$_darkModeAtom.reportWrite(value, super._darkMode, () {
      super._darkMode = value;
    });
  }

  final _$changeDarkModeAsyncAction =
      AsyncAction('ModeStoreBase.changeDarkMode');

  @override
  Future changeDarkMode() {
    return _$changeDarkModeAsyncAction.run(() => super.changeDarkMode());
  }

  final _$changeDarkModeLaunchAsyncAction =
      AsyncAction('ModeStoreBase.changeDarkModeLaunch');

  @override
  Future changeDarkModeLaunch(dynamic context) {
    return _$changeDarkModeLaunchAsyncAction
        .run(() => super.changeDarkModeLaunch(context));
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
