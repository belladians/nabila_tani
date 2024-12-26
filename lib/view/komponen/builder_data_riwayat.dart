import 'package:flutter/material.dart';

class BuilderMenuRiwayat extends StatelessWidget {
  final String id_barang_riwayat;
  final String id_barang;
  final String jumlah;
  final String tanggal;

  const BuilderMenuRiwayat({
    super.key,
    required this.id_barang,
    required this.id_barang_riwayat,
    required this.jumlah,
    required this.tanggal,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 0, 82, 72),
            borderRadius: BorderRadius.circular(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              id_barang_riwayat,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            Text(
              id_barang,
              style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w300,
                  color: Colors.white),
            ),
            Text(
              jumlah,
              style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w300,
                  color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Text(
                tanggal,
                style: const TextStyle(
                    fontWeight: FontWeight.w300, color: Colors.white),
              ),
            )
          ],
        )
        // Column(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         Row(
        //           children: [
        //             Text(
        //               id_barang_riwayat,
        //               style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        //             )
        //           ],
        //         ),
        //         Text(id_barang,
        //             style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
        //         Text(tanggal,
        //             style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500))
        //       ],
        //     ),
        //     Text(jumlah, style: TextStyle(fontSize: 20, color: Colors.white))
        //   ],
        // ),
        );
  }
}
