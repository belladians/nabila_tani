import 'dart:convert';
import 'package:aplikasi_tani/dataclass/dataclass_akun.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

Future<String?> ambil() async {
  // SharedPreferences akses = await SharedPreferences.getInstance();
  // String? username = akses.getString('username');
  // return username;
  var storage = FlutterSecureStorage();
  String? username = await storage.read(key: "user");
  return username;
}

Future dataAkun(List datalist) async {
  var username = await ambil();
  final url = await http.get(Uri.http('10.0.2.2:5000', 'akun/$username'));
  var data = await jsonDecode(url.body);
  datalist.clear();
  if (data.length > datalist.length) {
    for (var i in data) {
      if (i[2] == 1) {
        final dataAkun =
            DataclassAkun(nama_akun: i[0], hak_akses: "Pemilik", no_hp: i[1]);
        datalist.add(dataAkun);
      } else {
        final dataAkun =
            DataclassAkun(nama_akun: i[0], hak_akses: "Staff", no_hp: i[1]);
        datalist.add(dataAkun);
      }
    }
  }
}
