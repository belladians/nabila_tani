import 'package:aplikasi_tani/view/komponen/appbar.dart';
import 'package:aplikasi_tani/view/komponen/input_text_field.dart';
import 'package:aplikasi_tani/service/service_data_supplier.dart';
import 'package:flutter/material.dart';

class PerbaruiSupplier extends StatefulWidget {
  final id_supplier;
  final nama_supplier;
  final email;
  final alamat;
  const PerbaruiSupplier({
    super.key,
    required this.id_supplier,
    required this.nama_supplier,
    required this.email,
    required this.alamat,
  });

  @override
  State<PerbaruiSupplier> createState() => _PerbaruiSupplierState();
}

class _PerbaruiSupplierState extends State<PerbaruiSupplier> {
  late TextEditingController controller_id_supplier;
  late TextEditingController controller_nama_supplier;
  late TextEditingController controller_email;
  late TextEditingController controller_alamat;

  @override
  void dispose() {
    controller_id_supplier.dispose();
    controller_nama_supplier.dispose();
    controller_email.dispose();
    controller_alamat.dispose();
    super.dispose();
  }

  void initState() {
    super.initState();
    controller_id_supplier = TextEditingController(text: widget.id_supplier);
    controller_nama_supplier =
        TextEditingController(text: widget.nama_supplier);
    controller_email = TextEditingController(text: widget.email);
    controller_alamat = TextEditingController(text: widget.alamat);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBarComp(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 40,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  "Perbarui Data Supplier",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              InputTextField(
                isable: false,
                keytype: TextInputType.text,
                tipe: "Id Supplier",
                isPass: false,
                data: controller_id_supplier,
              ),
              InputTextField(
                isable: true,
                keytype: TextInputType.text,
                tipe: "Nama Supplier",
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
                keytype: TextInputType.emailAddress,
                tipe: "Alamat",
                isPass: false,
                data: controller_alamat,
              ),
              Container(
                margin: const EdgeInsets.all(20),
                width: 150,
                height: 60,
                child: ElevatedButton(
                  onPressed: () => {
                    perbaruiSupplier(
                        context,
                        controller_id_supplier.text.toString(),
                        controller_nama_supplier.text.toString(),
                        controller_email.text.toString(),
                        controller_alamat.text.toString()),
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(37, 211, 102, 73),
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
        ));
  }
}
