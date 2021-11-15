import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:leitor_codigo_barras/models/capture.model.dart';
import 'package:leitor_codigo_barras/services/product.service.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:http/http.dart' as http;
part 'capture.state.g.dart';

class CaptureState = _CaptureState with _$CaptureState;

abstract class _CaptureState with Store {
  CaptureModel _captureModel = CaptureModel();

  @observable
  String _code = '_______________';

  @observable
  bool _upload = false;

  @action
  void flash() {
    _captureModel.flash = !_captureModel.flash;
    IconFlash iconFlash =
        _captureModel.flash ? IconFlash.enabled : IconFlash.disabled;
    _captureModel.pathIconFlash = iconFlash.icon;
  }

  @action
  void scanMode() {
    IconScanMode iconScanMode = _captureModel.scanMode == ScanMode.BARCODE
        ? IconScanMode.BAR_CODE
        : IconScanMode.QR;
    if (_captureModel.scanMode == ScanMode.BARCODE) {
      _captureModel.scanMode = ScanMode.QR;
      _captureModel.pathIconScanMode = iconScanMode.icon;
    } else {
      _captureModel.scanMode = ScanMode.BARCODE;
      _captureModel.pathIconScanMode = iconScanMode.icon;
    }
  }

  @action
  void setCode(String value) {
    _code = value;
    _captureModel.code = value;
    _captureModel.captured = true;
  }

  @action
  void setDefault() {
    String _value = '_______________';
    _code = _value;
    _captureModel.code = _value;
    _captureModel.captured = false;
  }

  @action
  void clickUpload(bool state) {
    _captureModel.colorUploadIcon =
        state ? ColorUploadIcon.pressed.color : ColorUploadIcon.unpressed.color;
    _upload = state;
  }

  Future<bool> store(code, description) async {
    return true; //await createProduct(code, description);
  }

  CaptureModel get captureModel {
    return _captureModel;
  }

  String get code {
    return _code;
  }

  Color get colorUploadIcon {
    return _upload
        ? ColorUploadIcon.pressed.color
        : ColorUploadIcon.unpressed.color;
  }
}
