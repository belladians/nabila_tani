import 'package:aplikasi_tani/service/service_data_supplier.dart';
import 'package:aplikasi_tani/view/komponen/appbar.dart';
import 'package:aplikasi_tani/view/komponen/input_text_field.dart';
import 'package:flutter/material.dart';

class TambahSupplier extends StatefulWidget {
  const TambahSupplier({super.key});

  @override
  State<TambahSupplier> createState() => _TambahSupplierState();
}

class _TambahSupplierState extends State<TambahSupplier> {
  final controller_id_supplier = TextEditingController();
  final controller_nama_supplier = TextEditingController();
  final controller_email = TextEditingController();
  final controller_alamat_supplier = TextEditingController();

  @override
  void dispose() {
    controller_id_supplier.dispose();
    controller_nama_supplier.dispose();
    controller_email.dispose();
    controller_alamat_supplier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                "Tambah Data Supplier",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            InputTextField(
              isable: true,
              keytype: TextInputType.text,
              tipe: "Id Supplier",
              isPass: false,
              data: controller_id_supplier,
            ),
            InputTextField(
              isable: true,
              keytype: TextInputType.text,
              tipe: "Nama supplier",
              isPass: false,
              data: controller_nama_supplier,
            ),
            InputTextField(
              isable: true,
              keytype: TextInputType.emailAddress,
              tipe: "Email",
              isPass: false,
              data: controller_email,
            ),
            InputTextField(
              isable: true,
              keytype: TextInputType.text,
              tipe: "Alamat supplier",
              isPass: false,
              data: controller_alamat_supplier,
            ),
            Container(
              margin: const EdgeInsets.all(20),
              width: 150,
              height: 60,
              child: ElevatedButton(
                onPressed: () => {
                  tambahSupplier(
                    context,
                    controller_id_supplier.text,
                    controller_nama_supplier.text,
                    controller_email.text,
                    controller_alamat_supplier.text,
                  ),
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 0, 82, 72),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text(
                  "Simpan",
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
