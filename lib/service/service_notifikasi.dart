import 'dart:convert';
import 'package:aplikasi_tani/dataclass/dataclass_notifikasi.dart';
import 'package:http/http.dart' as http;

Future dataNotifikasi(List datalist) async {
  final url = await http.get(Uri.http('10.0.2.2:5000', 'notifikasi'));
  var data = jsonDecode(url.body);
  // if (data.length > datalist.length) {
  for (var i in data) {
    for (var x in i) {
      final dataBarang = DataclassNotifikasi(
          id_barang: x[0],
          nama_barang: x[1],
          jumlah_stok_min: x[3].toString(),
          stok_barang: x[2].toString(),
          jenis: x[4]);
      datalist.add(dataBarang);
    }
  }
  // }
}
