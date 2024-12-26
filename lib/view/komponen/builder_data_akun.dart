import 'package:flutter/material.dart';

class BuilderAkun extends StatelessWidget {
  final String nama_akun;
  final String hak_akses;
  final String no_hp;

  const BuilderAkun({
    super.key,
    required this.nama_akun,
    required this.hak_akses,
    required this.no_hp,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 0, 82, 72),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Icon(
              Icons.account_circle_rounded,
              size: 150,
            )),
            SizedBox(
              height: 30,
            ),
            Container(
              child: Text(
                "Nama: $nama_akun",
                overflow: TextOverflow.fade,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
            Text(
              "Hak akses: $hak_akses",
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                  color: Colors.white),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Text(
                "No Handpohone: $no_hp",
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                    color: Colors.white),
              ),
            ),
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
