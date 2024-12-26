import 'package:aplikasi_tani/view/komponen/appbar.dart';
import 'package:aplikasi_tani/view/laporan/laporan.dart';
import 'package:aplikasi_tani/view/masterdata/masterdata.dart';
import 'package:aplikasi_tani/view/notifikasi/notifikasi.dart';
import 'package:aplikasi_tani/view/pencatatan/pencatatan.dart';
import 'package:aplikasi_tani/view/pengajuan/pengajuan.dart';
import 'package:flutter/material.dart';

class HalamanDashboard extends StatefulWidget {
  const HalamanDashboard({super.key});

  @override
  State<HalamanDashboard> createState() => _HalamanDashboardState();
}

class _HalamanDashboardState extends State<HalamanDashboard> {
  int index = 0;
  final page = [
    const Pencatatan(),
    const MasterData(),
    const Restok(),
    const Laporan(),
    const Notifikasi()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComp(),
      body: page[index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
            indicatorColor: Color.fromARGB(255, 164, 181, 170),
            labelTextStyle: WidgetStateProperty.all(
                TextStyle(fontSize: 13, fontWeight: FontWeight.w800))),
        child: NavigationBar(
            height: 100,
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            animationDuration: Duration(seconds: 1),
            selectedIndex: index,
            onDestinationSelected: (index) =>
                setState(() => this.index = index),
            destinations: [
              NavigationDestination(
                icon: Icon(Icons.add_circle_outline),
                label: "Pencatatan",
                selectedIcon: Icon(Icons.add_circle),
              ),
              NavigationDestination(
                icon: Icon(Icons.data_object_outlined),
                label: "Master Data",
                selectedIcon: Icon(Icons.data_object_sharp),
              ),
              NavigationDestination(
                icon: Icon(Icons.stacked_bar_chart_rounded),
                label: "Pengajuan",
                selectedIcon: Icon(Icons.stacked_bar_chart_outlined),
              ),
              NavigationDestination(
                icon: Icon(Icons.description_outlined),
                label: "Laporan",
                selectedIcon: Icon(Icons.description),
              ),
              NavigationDestination(
                icon: Icon(Icons.notification_important),
                label: "Notifikasi",
                selectedIcon: Icon(Icons.notification_important),
              )
            ]),
      ),
    );
  }
}
