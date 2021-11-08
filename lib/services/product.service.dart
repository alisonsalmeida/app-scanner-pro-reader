import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<bool> createProduct(String code, String description) async {
  try {
    final response = await http.post(
      Uri.parse('http://192.168.0.143:8000/codes'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          <String, String>{'code': code, 'description': description}),
    );

    if (response.statusCode == 204) {
      return true;
    } else {
      return false;
    }
  } catch (e) {
    return false;
  }
}
