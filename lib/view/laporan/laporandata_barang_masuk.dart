import 'package:aplikasi_tani/view/komponen/appbar.dart';
import 'package:aplikasi_tani/service/service_laporan_barang_masuk.dart';
import 'package:flutter/material.dart';

class LaporanBarangMasuk extends StatefulWidget {
  const LaporanBarangMasuk({super.key});

  @override
  State<LaporanBarangMasuk> createState() => _LaporanBaranMasukState();
}

class _LaporanBaranMasukState extends State<LaporanBarangMasuk> {
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
                  "Laporan Barang Masuk",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              Container(
                margin: const EdgeInsets.all(10),
                width: 150,
                height: 60,
                child: ElevatedButton(
                  onPressed: () => {
                    ambilLaporanMasuk("laporan.csv"),
                    FocusScope.of(context).unfocus(),
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 43, 69, 54),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  child: const Text(
                    "Download CSV",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                width: 150,
                height: 60,
                child: ElevatedButton(
                  onPressed: () => {
                    ambilLaporanMasuk("laporan.pdf"),
                    FocusScope.of(context).unfocus(),
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 43, 69, 54),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  child: const Text(
                    "Download PDF",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
