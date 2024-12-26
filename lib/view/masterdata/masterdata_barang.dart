
import 'package:aplikasi_tani/service/service_cek_status.dart';
import 'package:aplikasi_tani/view/komponen/appbar.dart';
import 'package:aplikasi_tani/view/komponen/builder_data_barang.dart';
import 'package:aplikasi_tani/view/masterdata/masterdata_barang_cari.dart';
import 'package:aplikasi_tani/service/service_data_barang.dart';
import 'package:aplikasi_tani/view/masterdata/masterdata_barang_tambah.dart';
import 'package:flutter/material.dart';

class MasterDataBarang extends StatefulWidget {
  const MasterDataBarang({super.key});

  @override
  State<MasterDataBarang> createState() => _MasterDataBarangState();
}

class _MasterDataBarangState extends State<MasterDataBarang> {
  List mylist = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarComp(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Data Barang",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CariBarang()));
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                height: 50,
                width: 350,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.search,
                      size: 30,
                      color: Colors.grey[400],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Cari Barang",
                      style: TextStyle(color: Colors.grey[400]),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                  future: dataBarang(mylist),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return ListView.builder(
                          itemCount: mylist.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 10),
                              child: BuilderMenu(
                                id_barang: mylist[index].id_barang,
                                nama_barang: mylist[index].nama_barang,
                                harga_satuan:
                                    mylist[index].harga_satuan.toString(),
                                varian: mylist[index].varian,
                                max_stok: mylist[index].max_stok,
                                min_stok: mylist[index].min_stok,
                                expired_date: mylist[index].expired_date,
                                stok: mylist[index].stok_barang,
                                id_supplier: mylist[index].id_supplier,
                                id_kategori: mylist[index].id_kategori_barang,
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
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var cek = await cekStatus();
          if (cek == true) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => TambahBarang()));
          }
          FocusScope.of(context).unfocus();
        },
        backgroundColor: const Color.fromARGB(255, 0, 123, 109),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
