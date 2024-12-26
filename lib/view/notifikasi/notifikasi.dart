import 'package:aplikasi_tani/view/komponen/builder_data_notifikasi.dart';
import 'package:aplikasi_tani/service/service_notifikasi.dart';
import 'package:flutter/material.dart';

class Notifikasi extends StatelessWidget {
  const Notifikasi({super.key});

  @override
  Widget build(BuildContext context) {
    List mylist = [];
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Text(
            "Notifikasi",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: FutureBuilder(
              future: dataNotifikasi(mylist),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return ListView.builder(
                      itemCount: mylist.length,
                      itemBuilder: (context, index) {
                        return Container(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 2, horizontal: 10),
                            child: BuilderMenuNotifikasi(
                              id_barang: mylist[index].id_barang,
                              nama_barang: mylist[index].nama_barang,
                              stok_barang: mylist[index].stok_barang,
                              min_stok: mylist[index].jumlah_stok_min,
                              jenis: mylist[index].jenis,
                            ),
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
    );
  }
}
