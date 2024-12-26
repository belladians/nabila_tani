import 'dart:convert';
import 'package:aplikasi_tani/view/pencatatan/pencatatan_barang_keluar.dart';
import 'package:aplikasi_tani/view/komponen/toast.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<void> pencatatanBarangKeluar(
    BuildContext context, String id, String jumlah) async {
  const String url =
      'http://10.0.2.2:5000/pencatatan/data_barang_keluar/input_data';
  Map<String, String> headers = {"Content-Type": "application/json"};
  String jsonbody = jsonEncode({"id_barang": id, "jumlah": jumlah});

  try {
    final response =
        await http.post(Uri.parse(url), headers: headers, body: jsonbody);
    if (response.statusCode == 202) {
      Navigator.pop(context);
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const BarangKeluar()));
      customToast(
          "Barang keluar telah tercatatat.", Color.fromARGB(255, 69, 153, 107));
    } else if (response.statusCode == 401) {
      customToast("Stok tidak mencukupi.", Colors.red);
    } else {
      customToast("ID barang yang anda masukkan tidak ada.", Colors.red);
    }
  } catch (e) {
    print('Exception: $e');
  }
}
