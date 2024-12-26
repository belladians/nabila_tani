import 'package:aplikasi_tani/view/komponen/appbar.dart';
import 'package:aplikasi_tani/view/komponen/input_text_field.dart';
import 'package:aplikasi_tani/service/service_restok.dart';
import 'package:flutter/material.dart';

class RestokManual extends StatefulWidget {
  const RestokManual({super.key});

  @override
  State<RestokManual> createState() => _RestokManualState();
}

class _RestokManualState extends State<RestokManual> {
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
            SizedBox(
              height: 100,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                "Restok Barang Manual",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            InputTextField(
              isable: true,
              keytype: TextInputType.text,
              tipe: "ID Barang",
              isPass: false,
              data: controller_id_barang,
            ),
            InputTextField(
              isable: true,
              keytype: TextInputType.text,
              tipe: "Jumlah",
              isPass: false,
              data: controller_jumlah,
            ),
            Container(
              margin: const EdgeInsets.all(20),
              width: 150,
              height: 60,
              child: ElevatedButton(
                onPressed: () => {
                  restokManual(context, controller_id_barang.text.toString(),
                      controller_jumlah.text.toString()),
                  FocusScope.of(context).unfocus()
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 0, 82, 72),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text(
                  "Beli",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
