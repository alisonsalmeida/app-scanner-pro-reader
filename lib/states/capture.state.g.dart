// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'capture.state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CaptureState on _CaptureState, Store {
  final _$_codeAtom = Atom(name: '_CaptureState._code');

  @override
  String get _code {
    _$_codeAtom.reportRead();
    return super._code;
  }

  @override
  set _code(String value) {
    _$_codeAtom.reportWrite(value, super._code, () {
      super._code = value;
    });
  }

  final _$_uploadAtom = Atom(name: '_CaptureState._upload');

  @override
  bool get _upload {
    _$_uploadAtom.reportRead();
    return super._upload;
  }

  @override
  set _upload(bool value) {
    _$_uploadAtom.reportWrite(value, super._upload, () {
      super._upload = value;
    });
  }

  final _$_CaptureStateActionController =
      ActionController(name: '_CaptureState');

  @override
  void flash() {
    final _$actionInfo = _$_CaptureStateActionController.startAction(
        name: '_CaptureState.flash');
    try {
      return super.flash();
    } finally {
      _$_CaptureStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void scanMode() {
    final _$actionInfo = _$_CaptureStateActionController.startAction(
        name: '_CaptureState.scanMode');
    try {
      return super.scanMode();
    } finally {
      _$_CaptureStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCode(String value) {
    final _$actionInfo = _$_CaptureStateActionController.startAction(
        name: '_CaptureState.setCode');
    try {
      return super.setCode(value);
    } finally {
      _$_CaptureStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDefault() {
    final _$actionInfo = _$_CaptureStateActionController.startAction(
        name: '_CaptureState.setDefault');
    try {
      return super.setDefault();
    } finally {
      _$_CaptureStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clickUpload(bool state) {
    final _$actionInfo = _$_CaptureStateActionController.startAction(
        name: '_CaptureState.clickUpload');
    try {
      return super.clickUpload(state);
    } finally {
      _$_CaptureStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
