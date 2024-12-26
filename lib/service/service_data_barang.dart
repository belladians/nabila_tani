import 'dart:convert';
import 'package:aplikasi_tani/dataclass/dataclass_barang.dart';
import 'package:aplikasi_tani/view/masterdata/masterdata_barang.dart';
import 'package:aplikasi_tani/view/komponen/toast.dart';
import 'package:aplikasi_tani/view/masterdata/masterdata_barang_tambah.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future dataBarang(List datalist) async {
  final url = await http.get(Uri.http('10.0.2.2:5000', 'data_barang'));
  var data = jsonDecode(url.body);
  datalist.clear();
  if (data.length > datalist.length) {
    for (var i in data) {
      final dataBarang = DataclassBarang(
          id_barang: i[0],
          nama_barang: i[1],
          harga_satuan: i[2].toString(),
          stok_barang: i[3].toString(),
          min_stok: i[4].toString(),
          max_stok: i[5].toString(),
          varian: i[6],
          expired_date: i[7],
          id_supplier: i[8],
          id_kategori_barang: i[9]);
      datalist.add(dataBarang);
    }
  }
}

Future hapusBarang(BuildContext context, delete) async {
  String url = 'http://10.0.2.2:5000/data_barang/hapus';
  Map<String, String> headers = {"Content-Type": "application/json"};
  String jsonbody = jsonEncode({"id_barang": delete});

  try {
    final response =
        await http.post(Uri.parse(url), headers: headers, body: jsonbody);
    if (response.statusCode == 200) {
      Navigator.pop(context);
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const MasterDataBarang()));
    } else if (response.statusCode == 401) {
      customToast("Barang tidak ada.", Colors.red);
    } else if (response.statusCode == 402) {
      customToast("Barang tidak bisa dihapus.", Colors.red);
    }
  } catch (e) {
    print('Exception: $e');
  }
}

Future<void> perbaruiBarang(
    BuildContext context,
    String idBarang,
    String namaBarang,
    String hargaSatuan,
    String varian,
    String expiredDate,
    String idKategori,
    String idSupplier,
    String minStok,
    String maxStok) async {
  String url = 'http://10.0.2.2:5000/data_barang/perbarui';
  Map<String, String> headers = {"Content-Type": "application/json"};
  try {
    String jsonbody = jsonEncode({
      "id_barang": idBarang,
      "nama_barang": namaBarang,
      "harga_satuan": hargaSatuan,
      "expired_date": expiredDate,
      "varian": varian,
      "id_supplier": idSupplier,
      "id_kategori": idKategori,
      "min_stok": minStok,
      "max_stok": maxStok,
    });
    final response =
        await http.post(Uri.parse(url), headers: headers, body: jsonbody);
    if (response.statusCode == 201) {
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const MasterDataBarang()));
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

Future cariBarang(datalist, queryBarang) async {
  datalist.clear();
  String url = 'http://10.0.2.2:5000/data_barang/cari';
  Map<String, String> headers = {'Content-Type': 'application/json'};
  String jsonbody = jsonEncode({
    'pencarian': queryBarang,
  });
  final response = await http.post(
    Uri.parse(url),
    headers: headers,
    body: jsonbody,
  );
  if (response.statusCode == 200) {
    final jsondata = jsonDecode(response.body);
    print(jsondata);
    for (var i in jsondata) {
      var data = DataclassBarang(
          id_barang: i[0],
          nama_barang: i[1],
          harga_satuan: i[2].toString(),
          stok_barang: i[3].toString(),
          min_stok: i[4].toString(),
          max_stok: i[5].toString(),
          varian: i[6],
          expired_date: i[7],
          id_supplier: i[8],
          id_kategori_barang: i[9]);
      datalist.add(data);
    }
  }
}

Future<void> tambahBarang(
    BuildContext context,
    String idBarang,
    String namaBarang,
    String hargaSatuan,
    String varian,
    String expiredDate,
    String idKategori,
    String idSupplier,
    String minStok,
    String maxStok) async {
  const String url = 'http://10.0.2.2:5000/data_barang/tambah';
  Map<String, String> headers = {"Content-Type": "application/json"};
  try {
    String jsonbody = jsonEncode({
      "id_barang": idBarang,
      "nama_barang": namaBarang,
      "harga_satuan": hargaSatuan,
      "expired_date": expiredDate,
      "varian": varian,
      "id_supplier": idSupplier,
      "id_kategori": idKategori,
      "min_stok": minStok,
      "max_stok": maxStok
    });
    final response =
        await http.post(Uri.parse(url), headers: headers, body: jsonbody);
    if (response.statusCode == 201) {
      Navigator.pop(context);
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => TambahBarang()));
      Navigator.pop(context, true);
      customToast(
          "Barang telah ditambahkan.", Color.fromARGB(255, 69, 153, 107));
    } else if (response.statusCode == 401) {
      customToast("Anda tidak mengisi semua kolom.", Colors.red);
    } else if (response.statusCode == 402) {
      customToast("ID supplier atau ketegori tidak ada.", Colors.red);
    } else if (response.statusCode == 403) {
      customToast("ID sudah dipakai.", Colors.red);
    } else {
      customToast("Anda tidak mengisi semua kolom.", Colors.red);
    }
  } catch (e) {
    customToast(e.toString(), Colors.red);
  }
}
