import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:leitor_codigo_barras/models/capture.model.dart';
import 'package:leitor_codigo_barras/services/product.service.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:http/http.dart' as http;
part 'button.state.g.dart';

class Button = _ButtonState with _$Button;

abstract class _ButtonState with Store {
  @observable
  bool _clicked = false;

  @action
  void click() {
    _clicked = !_clicked;
  }

  bool get clicked {
    return _clicked;
  }
}
