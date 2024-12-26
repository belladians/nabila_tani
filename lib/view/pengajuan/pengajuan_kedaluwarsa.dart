import 'package:aplikasi_tani/service/service_restok.dart';
import 'package:aplikasi_tani/view/komponen/appbar.dart';
import 'package:aplikasi_tani/view/komponen/builder_data_kedaluwarsa.dart';
import 'package:flutter/material.dart';

class RestokKedaluwarsa extends StatefulWidget {
  const RestokKedaluwarsa({super.key});

  @override
  State<RestokKedaluwarsa> createState() => _RestokKedaluwarsaState();
}

class _RestokKedaluwarsaState extends State<RestokKedaluwarsa> {
  List mylist = [];
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
    Future<bool> dialogBarangKedaluwarsa(BuildContext context) async {
      return (await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text("Barang kedaluwarsa"),
              content: Text(
                  textAlign: TextAlign.justify,
                  "Barang yang mendekati kedaluwarsa akan dikembalikan ke supplier, dan yang sudah kedaluwarsa akan dikirim ke dinas pertanian.\n\nApakah anda yakin ingin melanjutkan?"),
              actions: [
                TextButton(
                  onPressed: () {
                    pengajuanKedaluwarsa();
                    Navigator.pop(context);
                  },
                  child: Text("Ya"),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text("Tidak"),
                ),
              ],
            ),
          )) ??
          false;
    }

    return Scaffold(
      appBar: const AppBarComp(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 20),
              child: Text(
                "Kelola kedaluwarsa",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              width: 150,
              height: 60,
              child: ElevatedButton(
                onPressed: () => {
                  dialogBarangKedaluwarsa(context),
                  FocusScope.of(context).unfocus()
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 0, 82, 72),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text(
                  "kelola",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 20),
              child: Text(
                "Daftar pengelolaan barang",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                  future: dataKedaluwarsa(mylist),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return ListView.builder(
                          itemCount: mylist.length,
                          itemBuilder: (context, index) {
                            return BuilderKedaluwarsa(
                                id_pengajuan: mylist[index].id_pengajuan,
                                jumlah_barang: mylist[index].jumlah,
                                jenis_pengajuan: mylist[index].jenis_pengajuan,
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
      ),
    );
  }
}
