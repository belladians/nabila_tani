import 'package:aplikasi_tani/view/komponen/appbar.dart';
import 'package:aplikasi_tani/service/service_laporan_barang.dart';
import 'package:flutter/material.dart';

class LaporanDataBarang extends StatefulWidget {
  const LaporanDataBarang({super.key});

  @override
  State<LaporanDataBarang> createState() => _LaporanDataBarangState();
}

class _LaporanDataBarangState extends State<LaporanDataBarang> {
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
                  "Laporan data barang",
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
                    ambilLaporanBarang("laporan.csv"),
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
                    ambilLaporanBarang("laporan.pdf"),
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
