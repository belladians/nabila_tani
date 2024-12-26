import 'package:aplikasi_tani/view/komponen/appbar.dart';
import 'package:aplikasi_tani/view/komponen/input_text_field.dart';
import 'package:aplikasi_tani/service/service_barang_keluar.dart';
import 'package:flutter/material.dart';

class BarangKeluar extends StatefulWidget {
  const BarangKeluar({super.key});

  @override
  State<BarangKeluar> createState() => _BarangKeluarState();
}

class _BarangKeluarState extends State<BarangKeluar> {
  final controller_id_barang = TextEditingController();
  final controller_jumlah = TextEditingController();

  @override
  void dispose() {
    controller_id_barang.dispose();
    controller_jumlah.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarComp(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  "Barang Keluar",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
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
                margin: const EdgeInsets.all(20),
                width: 150,
                height: 60,
                child: ElevatedButton(
                  onPressed: () => {
                    pencatatanBarangKeluar(context, controller_id_barang.text,
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
              )
            ],
          ),
        ));
  }
}
