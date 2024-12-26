import 'package:aplikasi_tani/service/service_restok.dart';
import 'package:aplikasi_tani/view/komponen/appbar.dart';
import 'package:aplikasi_tani/view/komponen/builder_data_pengajuan.dart';
import 'package:aplikasi_tani/view/komponen/input_text_field.dart';
import 'package:aplikasi_tani/service/service_barang_masuk.dart';
import 'package:flutter/material.dart';

class BarangMasuk extends StatefulWidget {
  const BarangMasuk({super.key});

  @override
  State<BarangMasuk> createState() => _BarangMasukState();
}

class _BarangMasukState extends State<BarangMasuk> {
  List mylist = [];
  final controller_id_barang = TextEditingController();
  final controller_jumlah = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarComp(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20, bottom: 10),
                child: Text(
                  "Barang Masuk",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              InputTextField(
                isable: true,
                keytype: TextInputType.text,
                tipe: "Id Barang",
                isPass: false,
                data: controller_id_barang,
              ),
              InputTextField(
                isable: true,
                keytype: TextInputType.number,
                tipe: "Jumlah Barang",
                isPass: false,
                data: controller_jumlah,
              ),
              Container(
                margin: const EdgeInsets.all(10),
                width: 150,
                height: 60,
                child: ElevatedButton(
                  onPressed: () => {
                    pencatatanBarangMasuk(context, controller_id_barang.text,
                        controller_jumlah.text),
                    FocusScope.of(context).unfocus(),
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 0, 82, 72),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  child: const Text(
                    "Simpan",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, bottom: 10),
                child: Text(
                  "Daftar Pengajuan",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: FutureBuilder(
                    future: dataPengajuanRestok(mylist),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return ListView.builder(
                            itemCount: mylist.length,
                            itemBuilder: (context, index) {
                              return BuilderPengajuan(
                                  id_pengajuan: mylist[index].id_pengajuan,
                                  jumlah_barang: mylist[index].jumlah,
                                  jenis_pengajuan:
                                      mylist[index].jenis_pengajuan,
                                  id_barang: mylist[index].id_barang);
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
        ));
  }
}