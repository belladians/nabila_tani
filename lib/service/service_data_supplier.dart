import 'dart:convert';
import 'package:aplikasi_tani/dataclass/dataclass_supplier.dart';
import 'package:aplikasi_tani/view/masterdata/masterdata_supplier.dart';
import 'package:aplikasi_tani/view/komponen/toast.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future dataSupplier(datalist) async {
  final url = await http.get(Uri.http('10.0.2.2:5000', 'supplier'));
  final response = jsonDecode(url.body);

  if (response.length > datalist.length) {
    for (var i in response) {
      final dataSupplier = DataclassSupplier(
          id_supplier: i[0],
          nama_supplier: i[1],
          email: i[2],
          alamat_supplier: i[3]);
      datalist.add(dataSupplier);
    }
  }
}

Future hapusSupplier(BuildContext context, delete) async {
  const String url = 'http://10.0.2.2:5000/supplier/hapus';
  Map<String, String> headers = {"Content-Type": "application/json"};
  String jsonbody = jsonEncode({"id_supplier": delete});

  try {
    final response =
        await http.post(Uri.parse(url), headers: headers, body: jsonbody);
    if (response.statusCode == 200) {
      Navigator.pop(context);
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const MasterDataSupplier()));
      print("berhasil");
    } else if (response.statusCode == 401) {
      customToast("Supplier tidak ada.", Colors.red);
    } else if (response.statusCode == 402) {
      customToast("Supplier masih tertaut.", Colors.red);
    }
  } catch (e) {
    print('Exception: $e');
  }
}

Future<void> perbaruiSupplier(BuildContext context, String idSupplier,
    String namaSupplier, String email, String alamatSupplier) async {
  const String url = 'http://10.0.2.2:5000/supplier/perbarui';
  Map<String, String> headers = {"Content-Type": "application/json"};
  try {
    String jsonbody = jsonEncode({
      "id_supplier": idSupplier,
      "nama_supplier": namaSupplier,
      "email": email,
      "alamat_supplier": alamatSupplier,
    });
    final response =
        await http.post(Uri.parse(url), headers: headers, body: jsonbody);
    print(jsonbody);
    if (response.statusCode == 201) {
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const MasterDataSupplier()));
      customToast(
          "Data berhasil diperbarui.", const Color.fromARGB(255, 69, 153, 107));
    } else if (response.statusCode == 401) {
      customToast("Data yang anda cari tidak ada.", Colors.red);
    } else if (response.statusCode == 402) {
      customToast("Anda tidak merubah data apapun.", Colors.red);
    }
  } catch (e) {
    print('Exception: $e');
  }
}

Future<void> tambahSupplier(
  BuildContext context,
  String idSupplier,
  String namaSupplier,
  String email,
  String alamatSupplier,
) async {
  const String url = 'http://10.0.2.2:5000/supplier/tambah';
  Map<String, String> headers = {"Content-Type": "application/json"};
  String jsonbody = jsonEncode({
    "id_supplier": idSupplier,
    "nama_supplier": namaSupplier,
    "email": email,
    "alamat": alamatSupplier,
  });

  try {
    final response =
        await http.post(Uri.parse(url), headers: headers, body: jsonbody);
    if (response.statusCode == 200) {
      Navigator.pop(context, true);
      Navigator.pop(context, true);
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const MasterDataSupplier()));
      customToast(
          "Supplier telah ditambahin.", Color.fromARGB(255, 69, 153, 107));
    } else if (response.statusCode == 401) {
      customToast("Anda tidak mengisi semua kolom.", Colors.red);
    } else if (response.statusCode == 402) {
      customToast("ID sudah dipakai.", Colors.red);
    }
  } catch (e) {
    customToast("eror", Colors.red);
  }
}

