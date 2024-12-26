import 'dart:convert';
import 'package:aplikasi_tani/dataclass/dataclass_barang.dart';
import 'package:http/http.dart' as http;

Future dataPrioritas(datalist, idKategoriBarang) async {
  datalist.clear();
  const url = 'http://10.0.2.2:5000/prioritas';
  Map<String, String> headers = {'Content-Type': 'application/json'};
  String jsonbody = jsonEncode({
    'id_kategori_barang': idKategoriBarang,
  });
  final response = await http.post(
    Uri.parse(url),
    headers: headers,
    body: jsonbody,
  );
  if (response.statusCode == 200) {
    final jsondata = jsonDecode(response.body);
    for (var i in jsondata) {
      var datakat = DataclassBarang(
          id_barang: i[0],
          nama_barang: i[1],
          harga_satuan: i[2].toString(),
          stok_barang: i[3].toString(),
          varian: i[6],
          expired_date: i[7].toString());
      datalist.add(datakat);
    }
  }
}
