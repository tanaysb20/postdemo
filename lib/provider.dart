import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'demo/class.dart';

class CustomProvider with ChangeNotifier {
  int og = 10;

  Future<bool> submitForm({String? name, String? job}) async {
    final url = Uri.parse("https://reqres.in/api/users");

    final response = await post(url,
        body: json.encode({"name": "jay", "job": "unemployed"}));

    if (response.statusCode == 200 || response.statusCode == 201) {
      print("SUccessfull");
      notifyListeners();
      return true;
    } else {
      print("no unsuccessfull");
      return false;
    }
  }
}
