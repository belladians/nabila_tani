import 'package:aplikasi_tani/view/komponen/menu_template.dart';
import 'package:aplikasi_tani/view/pencatatan/pencatatan_barang_keluar.dart';
import 'package:aplikasi_tani/view/pencatatan/pencatatan_barang_masuk.dart';
import 'package:flutter/material.dart';

class Pencatatan extends StatelessWidget {
  const Pencatatan({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const BarangMasuk()));
              print("masuk");
            },
            child: const MenuTemplate(
              iconmenu: Icons.move_to_inbox,
              textmenu: "Barang Masuk",
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const BarangKeluar()));
              print("masuk");
            },
            child: const MenuTemplate(
              iconmenu: Icons.outbox,
              textmenu: "Barang Keluar",
            ),
          ),
        ],
      ),
    );
  }
}