import 'package:aplikasi_tani/service/service_restok.dart';
import 'package:aplikasi_tani/view/komponen/appbar.dart';
import 'package:flutter/material.dart';

class RestokOtomatis extends StatefulWidget {
  const RestokOtomatis({super.key});

  @override
  State<RestokOtomatis> createState() => _RestokOtomatisState();
}

class _RestokOtomatisState extends State<RestokOtomatis> {
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
    Future<bool> dialogRestokOtomatis(BuildContext context) async {
      return (await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text("Restok Otomatis"),
              content: Text(
                  textAlign: TextAlign.justify,
                  "Semua barang yang kurang, dan habis akan dipesan sampai jumlah stok maksimal.\n\nApakah anda yakin ingin melanjutkan?"),
              actions: [
                TextButton(
                  onPressed: () {
                    restokOtomatis();
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
      appBar: AppBarComp(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 150,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 0),
              child: Text(
                "Restok Otomatis",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              width: 150,
              height: 60,
              child: ElevatedButton(
                onPressed: () => {
                  dialogRestokOtomatis(context),
                  FocusScope.of(context).unfocus(),
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 0, 82, 72),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: Text(
                  "Restok",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
