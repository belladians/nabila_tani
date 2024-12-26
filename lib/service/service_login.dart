import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
// "Pemilik"
// untuk menyimpan data yang ingin kita simpan pada device dengan aman
var storage = FlutterSecureStorage();

Future<void> keepuser(String username) async {
  await storage.write(key: "user", value: username);
}

Future<void> login(
    BuildContext context, String inputUsername, String inputPassword) async {
  const String url = 'http://10.0.2.2:5000/login';
  Map<String, String> headers = {"Content-Type": "application/json"};
  String jsonBody =
      jsonEncode({"username": inputUsername, "password": inputPassword});

  try {
    final response =
        await http.post(Uri.parse(url), headers: headers, body: jsonBody);
    if (response.statusCode == 202) {
      // await simpanUsername(inputUsername);
      await keepuser(inputUsername);
      Navigator.pushReplacementNamed(context, '/dashboard');
    } else if (response.statusCode == 400) {
      print('akun tidak ada');
    } else {
      print('isi semua kolom');
    }
  } catch (e) {
    print('Exception: $e');
  }
}
