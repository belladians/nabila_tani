import 'dart:convert';
import 'package:aplikasi_tani/view/pencatatan/pencatatan_barang_masuk.dart';
import 'package:aplikasi_tani/view/komponen/toast.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<void> pencatatanBarangMasuk(
    BuildContext context, String id, String jumlah) async {
  String url = 'http://10.0.2.2:5000/pencatatan/data_barang_masuk/input_data';
  Map<String, String> headers = {"Content-Type": "application/json"};
  String jsonbody = jsonEncode({"id_barang": id, "jumlah": jumlah});

  try {
    final response =
        await http.post(Uri.parse(url), headers: headers, body: jsonbody);
    if (response.statusCode == 202) {
      Navigator.pop(context);
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const BarangMasuk()));
      customToast(
          "Barang masuk telah tercatat.", Color.fromARGB(255, 69, 153, 107));
    } else if (response.statusCode == 401) {
      customToast("ID barang yang anda masukkan tidak ada.", Colors.red);
    } else if (response.statusCode == 402) {
      customToast("Stok melebihi batas maksimal.", Colors.red);
    } else {
      customToast("eror", Colors.red);
    }
  } catch (e) {
    print('Exception: $e');
  }
}
