import 'package:aplikasi_tani/view/komponen/appbar.dart';
import 'package:aplikasi_tani/view/komponen/builder_data_barang.dart';
import 'package:aplikasi_tani/view/komponen/input_text_field.dart';
import 'package:aplikasi_tani/service/service_data_barang.dart';
import 'package:flutter/material.dart';

class CariBarang extends StatefulWidget {
  const CariBarang({super.key});

  @override
  State<CariBarang> createState() => _CariBarangState();
}

class _CariBarangState extends State<CariBarang> {
  final controller_cari = TextEditingController();
  List mylist = [];
  Future? hasil;

  void _search() {
    setState(() {
      hasil = cariBarang(mylist, controller_cari.text.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComp(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                "Cari Barang",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            InputTextField(
              isable: true,
              tipe: "Cari Barang",
              isPass: false,
              keytype: TextInputType.text,
              data: controller_cari,
            ),
            Container(
              width: 150,
              height: 60,
              child: ElevatedButton(
                onPressed: () => {
                  _search(),
                  FocusScope.of(context).unfocus(),
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 0, 82, 72),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text(
                  "Cari",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
            ),
            // Expanded(
            //     child: FutureBuilder(
            //         future: _future,
            //         builder: ((context, snapshot) {
            //           if (snapshot.connectionState == ConnectionState.done) {
            //             if (mylist.isEmpty) {
            //               return const Center(
            //                 child: Text("Barang Kosong."),
            //               );
            //             }
            //             return ListView.builder(
            //                 itemCount: mylist.length,
            //                 itemBuilder: (context, index) {
            //                   return Container(
            //                     child: BuilderMenu(
            //                       id_barang: mylist[index].id_barang,
            //                       nama_barang: mylist[index].nama_barang,
            //                       harga_satuan:
            //                           mylist[index].harga_satuan.toString(),
            //                       varian: mylist[index].varian,
            //                       max_stok: mylist[index].max_stok,
            //                       min_stok: mylist[index].min_stok,
            //                       expired_date: mylist[index].expired_date,
            //                       stok: mylist[index].stok_barang,
            //                       id_supplier: mylist[index].id_supplier,
            //                       id_kategori: mylist[index].id_kategori_barang,
            //                     ),
            //                   );
            //                 });
            //           } else {
            //             return const Center(
            //               child: Text("Masukkan ID barang."),
            //             );
            //           }
            //         })))
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: FutureBuilder(
                  future: hasil,
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
                        child: Text("Masukkan nama barang."),
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
