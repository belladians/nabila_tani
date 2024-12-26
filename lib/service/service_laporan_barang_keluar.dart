import "package:aplikasi_tani/view/komponen/toast.dart";
import "package:flutter/material.dart";
import "package:url_launcher/url_launcher.dart";

Future<void> ambilLaporanKeluar(String jenisfile) async {
  // final event = await http.get(Uri.http('10.0.2.2:5000', 'laporan'));

  final String pdfurl =
      'http://10.0.2.2:5000/laporan/data_barang_keluar/$jenisfile';
  Uri uri = Uri.parse(pdfurl);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    customToast("Download gagal.", Colors.red);
  }
}
