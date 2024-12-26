import 'package:flutter/material.dart';

class BuilderMenuNotifikasi extends StatelessWidget {
  final String id_barang;
  final String nama_barang;
  final String stok_barang;
  final String min_stok;
  final String jenis;

  const BuilderMenuNotifikasi({
    super.key,
    required this.id_barang,
    required this.nama_barang,
    required this.stok_barang,
    required this.min_stok,
    required this.jenis,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 0, 82, 72),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Barang $jenis",
              style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Text(
              "Id barang: $id_barang",
              style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w300,
                  color: Colors.white),
            ),
            Text(
              "Nama barang: $nama_barang",
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
          ],
        ));
  }
}
