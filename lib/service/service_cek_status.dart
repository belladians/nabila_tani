import 'dart:convert';
import 'package:aplikasi_tani/view/komponen/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

Future<String?> ambil() async {
  var storage = FlutterSecureStorage();
  String? username = await storage.read(key: "user");
  return username;
}

Future<bool> cekStatus() async {
  String? username = await ambil();
  final linkcek =
      await http.get(Uri.http('10.0.2.2:5000', 'cek_status/$username'));
  var data = jsonDecode(linkcek.body);
  if (data['hak_akses'] == 0) {
    customToast("Anda tidak memiliki akses untuk melakukan ini", Colors.red);
    return false;
  } else if (data['hak_akses'] == 1) {
    return true;
  } else {
    return false;
  }
}
