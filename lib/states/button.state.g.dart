// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'button.state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Button on _ButtonState, Store {
  final _$_clickedAtom = Atom(name: '_ButtonState._clicked');

  @override
  bool get _clicked {
    _$_clickedAtom.reportRead();
    return super._clicked;
  }

  @override
  set _clicked(bool value) {
    _$_clickedAtom.reportWrite(value, super._clicked, () {
      super._clicked = value;
    });
  }

  final _$_ButtonStateActionController = ActionController(name: '_ButtonState');

  @override
  void click() {
    final _$actionInfo =
        _$_ButtonStateActionController.startAction(name: '_ButtonState.click');
    try {
      return super.click();
    } finally {
      _$_ButtonStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
