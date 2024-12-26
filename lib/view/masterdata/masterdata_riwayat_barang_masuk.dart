import 'package:aplikasi_tani/view/komponen/appbar.dart';
import 'package:aplikasi_tani/view/komponen/builder_data_riwayat.dart';
import 'package:aplikasi_tani/service/service_riwayat_barang.dart';
import 'package:flutter/material.dart';

class RiwayatMasuk extends StatefulWidget {
  const RiwayatMasuk({super.key});

  @override
  State<RiwayatMasuk> createState() => _RiwayatMasukState();
}

class _RiwayatMasukState extends State<RiwayatMasuk> {
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
                "Riwayat Barang Masuk",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                  future: dataRiwayatMasuk(list1),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: list1.length,
                          itemBuilder: (context, index) {
                            return Container(
                              child: BuilderMenuRiwayat(
                                id_barang_riwayat:
                                    "Id barang masuk: ${list1[index].id_barang_riwayat}",
                                jumlah:
                                    "Jumlah Barang Masuk: ${list1[index].jumlah}",
                                tanggal: "Tanggal Masuk: ${list1[index].tgl}",
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
