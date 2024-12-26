import 'dart:convert';
import 'package:aplikasi_tani/dataclass/dataclass_pengajuan.dart';
import 'package:aplikasi_tani/view/pencatatan/pencatatan_barang_masuk.dart';
import 'package:aplikasi_tani/view/pengajuan/pengajuan_manual.dart';
import 'package:aplikasi_tani/view/komponen/toast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

Future<void> restokManual(
    BuildContext context, String id_barang, String jumlah) async {
  const String url = 'http://10.0.2.2:5000/restok/manual';
  Map<String, String> headers = {"Content-Type": "application/json"};
  try {
    String jsonbody = jsonEncode({
      "id_barang": id_barang,
      "jumlah": jumlah,
    });
    final response =
        await http.post(Uri.parse(url), headers: headers, body: jsonbody);
    if (response.statusCode == 201) {
      Navigator.pop(context);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => RestokManual()));

      customToast(
          "Pemesanan berhasil.", const Color.fromARGB(255, 69, 153, 107));
    } else if (response.statusCode == 401) {
      customToast("Data yang anda cari tidak ada.", Colors.red);
    } else if (response.statusCode == 402) {
      customToast("Pembelian melebihi batas maksimal stok.", Colors.red);
    } else if (response.statusCode == 403) {
      customToast("Data supplier tidak ada.", Colors.red);
    } else if (response.statusCode == 404) {
      customToast(
          "Anda masih melakukan pengajuan pada barang tersebut.", Colors.red);
    } else if (response.statusCode == 405) {
      customToast(
          "Barang tersebut sudah mendekati kedaluwarsa, silahkan proses barang tersebut terlebih dahulu.",
          Colors.red);
    } else if (response.statusCode == 406) {
      customToast(
          "Barang tersebut sudah kedaluwarsa, silahkan proses barang tersebut terlebih dahulu.",
          Colors.red);
    }
  } catch (e) {
    print('Exception: $e');
  }
}

Future restokOtomatis() async {
  try {
    final url = await http.get(Uri.http('10.0.2.2:5000', 'restok/otomatis'));
    var data = jsonDecode(url.statusCode.toString());

    if (data == 200) {
      customToast("Restok Otomatis Berhasil", Colors.green);
    } else if (data == 400) {
      customToast("Restok Otomatis Gagal", Colors.red);
    }
  } catch (err) {
    customToast("Error", Colors.red);
  }
}

Future pengajuanKedaluwarsa() async {
  try {
    final url = await http
        .get(Uri.http('10.0.2.2:5000', 'restok/pengajuan/kedaluwarsa'));
    var data = jsonDecode(url.statusCode.toString());
    if (data == 200) {
      customToast("Pengajuan Berhasil", Colors.green);
    } else if (data == 400) {
      customToast("Pengajuan Gagal", Colors.red);
    }
  } catch (err) {
    customToast("Error", Colors.red);
  }
}

Future dataKedaluwarsa(List datalist) async {
  final url =
      await http.get(Uri.http('10.0.2.2:5000', "/restok/riwayat/kedaluwarsa"));
  var data = jsonDecode(url.body);
  print(data);
  datalist.clear();

  for (var i in data) {
    final data_kedaluwarsa = Dataclasspengajuan(
        id_pengajuan: i[0],
        id_barang: i[2].toString(),
        jenis_pengajuan: i[3],
        jumlah: i[1]);
    datalist.add(data_kedaluwarsa);
  }
}

Future penerimaanKedaluwarsa(
    BuildContext context, id_pengajuan, id_barang, jumlah) async {
  String url = 'http://10.0.2.2:5000/restok/pengajuan/kedaluwarsa/penerimaan';
  Map<String, String> headers = {"Content-Type": "application/json"};

  String jsonbody = jsonEncode(
      {"id_pengajuan": id_pengajuan, "id_barang": id_barang, "jumlah": jumlah});
  final response =
      await http.post(Uri.parse(url), headers: headers, body: jsonbody);
  if (response.statusCode == 200) {
    customToast("Pengajuan pembelian telah diterima.",
        Color.fromARGB(255, 69, 153, 107));
  } else if (response.statusCode == 400) {
    customToast("Error.", Colors.red);
  }
}

Future hapusKedaluwarsa(BuildContext context, int id_pengajuan) async {
  String url = 'http://10.0.2.2:5000/restok/pengajuan/kedaluwarsa/hapus';
  Map<String, String> headers = {"Content-Type": "application/json"};

  String jsonbody = jsonEncode({"id_pengajuan": id_pengajuan});
  final response =
      await http.post(Uri.parse(url), headers: headers, body: jsonbody);
  if (response.statusCode == 200) {
    customToast("Pengajuan telah dihapus.", Color.fromARGB(255, 69, 153, 107));
  } else if (response.statusCode == 400) {
    customToast("Error.", Colors.red);
  }
}

Future dataPengajuanRestok(List datalist) async {
  final url =
      await http.get(Uri.http('10.0.2.2:5000', "/restok/riwayat/pengajuan"));
  var data = jsonDecode(url.body);
  datalist.clear();

  for (var i in data) {
    final data_pengajuan = Dataclasspengajuan(
        id_pengajuan: i[0],
        id_barang: i[2].toString(),
        jenis_pengajuan: i[3],
        jumlah: i[1]);
    datalist.add(data_pengajuan);
  }
}

Future pengajuanDiterima(
    context, String id_barang, int id_pengajuan, int jumlah) async {
  String url = 'http://10.0.2.2:5000/restok/pengajuan/penerimaan';
  Map<String, String> headers = {"Content-Type": "application/json"};

  String jsonbody = jsonEncode(
      {"id_pengajuan": id_pengajuan, "id_barang": id_barang, "jumlah": jumlah});
  final response =
      await http.post(Uri.parse(url), headers: headers, body: jsonbody);
  if (response.statusCode == 200) {
    Navigator.pop(context);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => BarangMasuk()));
    customToast("Pengajuan pembelian telah diterima.",
        Color.fromARGB(255, 69, 153, 107));
  } else if (response.statusCode == 400) {
    customToast("Error.", Colors.red);
  }
}

Future pengajuanHapus(BuildContext context, int id_pengajuan) async {
  String url = 'http://10.0.2.2:5000/restok/pengajuan/hapus';
  Map<String, String> headers = {"Content-Type": "application/json"};

  String jsonbody = jsonEncode({"id_pengajuan": id_pengajuan});
  final response =
      await http.post(Uri.parse(url), headers: headers, body: jsonbody);
  if (response.statusCode == 200) {
    Navigator.pop(context);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => BarangMasuk()));
    customToast("Pengajuan pembelian telah dihapus.",
        Color.fromARGB(255, 69, 153, 107));
  } else if (response.statusCode == 400) {
    customToast("Error.", Colors.red);
  }
}
