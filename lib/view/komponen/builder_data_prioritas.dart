import 'package:flutter/material.dart';

class BuilderMenuPrioritas extends StatelessWidget {
  final String id_barang;
  final String nama_barang;
  final String stok_barang;
  final String varian;
  final String expired_date;

  const BuilderMenuPrioritas({
    super.key,
    required this.id_barang,
    required this.nama_barang,
    required this.stok_barang,
    required this.varian,
    required this.expired_date,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 0, 82, 72),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
            Text(
              "Stok barang: $stok_barang",
              style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w300,
                  color: Colors.white),
            ),
            Text(
              "varian: $varian",
              style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w300,
                  color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Text(
                "Expired date: $expired_date",
                style:
                    const TextStyle(fontWeight: FontWeight.w300, color: Colors.white),
              ),
            )
          ],
        ));
  }
}
