// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CreateStore on _CreateStore, Store {
  final _$_nameAtom = Atom(name: '_CreateStore._name');

  @override
  String get _name {
    _$_nameAtom.reportRead();
    return super._name;
  }

  @override
  set _name(String value) {
    _$_nameAtom.reportWrite(value, super._name, () {
      super._name = value;
    });
  }

  final _$_fieldsAtom = Atom(name: '_CreateStore._fields');

  @override
  List<String> get _fields {
    _$_fieldsAtom.reportRead();
    return super._fields;
  }

  @override
  set _fields(List<String> value) {
    _$_fieldsAtom.reportWrite(value, super._fields, () {
      super._fields = value;
    });
  }

  final _$_CreateStoreActionController = ActionController(name: '_CreateStore');

  @override
  void addField(String value) {
    final _$actionInfo = _$_CreateStoreActionController.startAction(
        name: '_CreateStore.addField');
    try {
      return super.addField(value);
    } finally {
      _$_CreateStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void name(String value) {
    final _$actionInfo =
        _$_CreateStoreActionController.startAction(name: '_CreateStore.name');
    try {
      return super.name(value);
    } finally {
      _$_CreateStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
