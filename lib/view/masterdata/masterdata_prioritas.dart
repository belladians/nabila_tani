import 'package:aplikasi_tani/view/komponen/appbar.dart';
import 'package:aplikasi_tani/view/komponen/builder_data_prioritas.dart';
import 'package:aplikasi_tani/service/service_prioritas.dart';
import 'package:flutter/material.dart';

class MasterDataPrioritas extends StatefulWidget {
  const MasterDataPrioritas({super.key});

  @override
  State<MasterDataPrioritas> createState() => _MasterDataPrioritasState();
}

class _MasterDataPrioritasState extends State<MasterDataPrioritas> {
  String? data;
  List mylist = [];
  Future? _future;

  void _search() {
    setState(() {
      _future = dataPrioritas(mylist, data);
    });
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
                height: 50,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  "Daftar Prioritas Penjualan",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              DropdownMenu(
                  onSelected: (value) {
                    setState(() {
                      data = value;
                    });
                  },
                  dropdownMenuEntries: const <DropdownMenuEntry<String>>[
                    DropdownMenuEntry(value: "001", label: "001"),
                    DropdownMenuEntry(value: "002", label: "002"),
                    DropdownMenuEntry(value: "003", label: "003"),
                    DropdownMenuEntry(value: "004", label: "004"),
                    DropdownMenuEntry(value: "005", label: "005"),
                    DropdownMenuEntry(value: "006", label: "006"),
                    DropdownMenuEntry(value: "007", label: "007"),
                  ]),
              Container(
                margin: const EdgeInsets.all(20),
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
              Expanded(
                  child: FutureBuilder(
                      future: _future,
                      builder: ((context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          if (mylist.isEmpty) {
                            return const Center(
                              child: Text("Barang Kosong."),
                            );
                          }
                          return ListView.builder(
                              itemCount: mylist.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  child: BuilderMenuPrioritas(
                                    id_barang: mylist[index].id_barang,
                                    nama_barang: mylist[index].nama_barang,
                                    stok_barang: mylist[index].stok_barang,
                                    varian: mylist[index].varian,
                                    expired_date: mylist[index].expired_date,
                                  ),
                                );
                              });
                        } else {
                          return const Center(
                            child: Text("Masukkan ID barang."),
                          );
                        }
                      })))
            ],
          ),
        ));
  }
}
