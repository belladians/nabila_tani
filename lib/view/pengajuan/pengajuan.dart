import 'package:aplikasi_tani/service/service_cek_status.dart';
import 'package:aplikasi_tani/view/komponen/menu_template.dart';
import 'package:aplikasi_tani/view/pengajuan/pengajuan_menu.dart';
import 'package:flutter/material.dart';

class Restok extends StatelessWidget {
  const Restok({super.key});

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
                  var cek = await cekStatus();
                  if (cek == true) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => RestokMenu()));
                  }
                },
                child: MenuTemplate(
                  iconmenu: Icons.auto_fix_normal,
                  textmenu: "Pengajuan Barang",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
