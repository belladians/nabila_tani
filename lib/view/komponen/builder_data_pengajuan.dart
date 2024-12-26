import 'package:aplikasi_tani/service/service_restok.dart';
import 'package:flutter/material.dart';

class BuilderPengajuan extends StatelessWidget {
  final int id_pengajuan;
  final int jumlah_barang;
  final String jenis_pengajuan;
  final String id_barang;

  const BuilderPengajuan({
    super.key,
    required this.id_pengajuan,
    required this.jumlah_barang,
    required this.jenis_pengajuan,
    required this.id_barang,
  });
  @override
  Widget build(BuildContext context) {
    Future<bool> dialogTerima(BuildContext context) async {
      return (await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text("Barang masuk"),
              content: Text("Apakah barang sudah diterima?"),
              actions: [
                TextButton(
                  onPressed: () {
                    pengajuanDiterima(
                        context, id_barang, id_pengajuan, jumlah_barang);
                    // customToast("Data supplier berhasil dihapus.",
                    //     Color.fromARGB(255, 69, 153, 107));
                    Navigator.pop(context);
                  },
                  child: Text("Ya"),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text("Tidak"),
                ),
              ],
            ),
          )) ??
          false;
    }

    Future<bool> dialogHapus(BuildContext context) async {
      return (await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text("Hapus Pengajuan"),
              content: Text("Apakah anda ingin menghapus pengajuan?"),
              actions: [
                TextButton(
                  onPressed: () {
                    pengajuanHapus(context, id_pengajuan);
                    // customToast("Data supplier berhasil dihapus.",
                    //     Color.fromARGB(255, 69, 153, 107));
                    Navigator.pop(context);
                  },
                  child: Text("Ya"),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text("Tidak"),
                ),
              ],
            ),
          )) ??
          false;
    }

    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 0, 82, 72),
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            Column(
              children: [
                GestureDetector(
                  onTap: () async {
                    dialogHapus(context);
                  },
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(10)),
                    child: Icon(
                      Icons.delete,
                      size: 40,
                      color: Colors.red,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    dialogTerima(context);
                  },
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 15, 0),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(10)),
                    child: Icon(
                      Icons.check_circle,
                      size: 40,
                      color: Colors.orange,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 20,
            ),
            Container(
              width: 230,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "$jenis_pengajuan",
                    maxLines: 2,
                    style: const TextStyle(
                        fontSize: 22,
                        overflow: TextOverflow.visible,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "ID barang: $id_barang",
                    style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                  Text(
                    "Jumlah: $jumlah_barang",
                    style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
