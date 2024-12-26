// service riwayat baran
import 'dart:convert';

import 'package:aplikasi_tani/dataclass/dataclass_riwayat_barang.dart';
import 'package:http/http.dart' as http;

Future dataRiwayatMasuk(datalist) async {
  final data = await http.get(Uri.http('10.0.2.2:5000', 'riwayat/masuk'));
  final response = jsonDecode(data.body);
  if (response.length > datalist.length) {
    for (var i in response) {
      final riwayat = DataclassRiwayat(
          id_barang_riwayat: i[0].toString(),
          jumlah: i[1].toString(),
          tgl: i[2].toString(),
          id_barang: i[3]);
      datalist.add(riwayat);
    }
  }
}

Future dataRiwayatKeluar(datalist) async {
  final data = await http.get(Uri.http('10.0.2.2:5000', 'riwayat/keluar'));
  final response = jsonDecode(data.body);
  if (response.length > datalist.length) {
    for (var i in response) {
      final riwayat = DataclassRiwayat(
          id_barang_riwayat: i[0].toString(),
          jumlah: i[1].toString(),
          tgl: i[2].toString(),
          id_barang: i[3]);
      datalist.add(riwayat);
    }
  }
}
