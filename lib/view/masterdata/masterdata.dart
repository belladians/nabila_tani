import 'package:aplikasi_tani/view/masterdata/masterdata_barang.dart';
import 'package:aplikasi_tani/view/masterdata/masterdata_riwayat_barang_keluar.dart';
import 'package:aplikasi_tani/view/masterdata/masterdata_riwayat_barang_masuk.dart';
import 'package:aplikasi_tani/view/masterdata/masterdata_prioritas.dart';
import 'package:aplikasi_tani/view/masterdata/masterdata_supplier.dart';
import 'package:aplikasi_tani/view/komponen/menu_template.dart';
import 'package:flutter/material.dart';

class MasterData extends StatelessWidget {
  const MasterData({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      margin: const EdgeInsets.all(20),
      child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RiwayatMasuk()));
                },
                child: const MenuTemplate(
                  iconmenu: Icons.history,
                  textmenu: "Riwayat Barang Masuk",
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RiwayatKeluar()));
                },
                child: MenuTemplate(
                  iconmenu: Icons.history,
                  textmenu: "Riwayat Barang Keluar",
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MasterDataPrioritas()));
                },
                child: const MenuTemplate(
                  iconmenu: Icons.priority_high_rounded,
                  textmenu: "Daftar Prioritas Penjualan",
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MasterDataSupplier()));
                },
                child: const MenuTemplate(
                  iconmenu: Icons.people_alt_rounded,
                  textmenu: "Data Supplier",
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MasterDataBarang()));
                },
                child: const MenuTemplate(
                  iconmenu: Icons.storefront_outlined,
                  textmenu: "Data Barang",
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
