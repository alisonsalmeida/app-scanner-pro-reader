import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:leitor_codigo_barras/models/create_sheet.model.dart';
import 'package:leitor_codigo_barras/models/sheet.model.dart';

class SheetService {
  Future<Sheet?> createProduct(CreateSheet createSheet) async {
    try {
      final response = await http.post(
        Uri.parse('http://192.168.0.143:8000/codes'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: createSheet.toJson(),
      );

      if (response.statusCode == 201) {
        print('criou: ${response.body}');

        return Sheet.fromJson(jsonDecode(response.body));
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
