import 'package:aplikasi_tani/view/laporan/laporandata_barang_keluar.dart';
import 'package:aplikasi_tani/view/laporan/laporandata_barang_masuk.dart';
import 'package:aplikasi_tani/view/laporan/laporandata_barang.dart';
import 'package:aplikasi_tani/view/komponen/menu_template.dart';
import 'package:flutter/material.dart';

class Laporan extends StatelessWidget {
  const Laporan({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      margin: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LaporanBarangMasuk()));
                },
                child: const MenuTemplate(
                  iconmenu: Icons.storefront_outlined,
                  textmenu: "Laporan Barang Masuk",
                ),
              ),
              GestureDetector(
                onTap: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LaporanBarangKeluar()));
                },
                child: const MenuTemplate(
                  iconmenu: Icons.storefront_outlined,
                  textmenu: "Laporan Barang Keluar",
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () async {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LaporanDataBarang()));
            },
            child: MenuTemplate(
              iconmenu: Icons.storefront_outlined,
              textmenu: "Laporan Data Barang",
            ),
          ),
        ],
      ),
    );
  }
}
