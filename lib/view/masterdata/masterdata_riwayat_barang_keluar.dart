import 'package:aplikasi_tani/view/komponen/appbar.dart';
import 'package:aplikasi_tani/view/komponen/builder_data_riwayat.dart';
import 'package:aplikasi_tani/service/service_riwayat_barang.dart';
import 'package:flutter/material.dart';

class RiwayatKeluar extends StatefulWidget {
  const RiwayatKeluar({super.key});

  @override
  State<RiwayatKeluar> createState() => _RiwayatKeluarState();
}

class _RiwayatKeluarState extends State<RiwayatKeluar> {
  List list1 = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarComp(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 30, bottom: 30),
              child: Text(
                "Riwayat Barang Keluar",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                  future: dataRiwayatKeluar(list1),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: list1.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.all(5),
                              child: BuilderMenuRiwayat(
                                id_barang_riwayat:
                                    "Id barang keluar: ${list1[index].id_barang_riwayat}",
                                jumlah:
                                    "Jumlah Barang Keluar: ${list1[index].jumlah}",
                                tanggal: "Tanggal Keluar: ${list1[index].tgl}",
                                id_barang:
                                    "Id Barang: ${list1[index].id_barang}",
                              ),
                            );
                          });
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
