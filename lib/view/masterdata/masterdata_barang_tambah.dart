import 'package:aplikasi_tani/service/service_data_barang.dart';
import 'package:aplikasi_tani/view/komponen/appbar.dart';
import 'package:aplikasi_tani/view/komponen/input_text_field.dart';
import 'package:flutter/material.dart';

class TambahBarang extends StatefulWidget {
  const TambahBarang({super.key});

  @override
  State<TambahBarang> createState() => _TambahBarangState();
}

class _TambahBarangState extends State<TambahBarang> {
  final controller_id_barang = TextEditingController();
  final controller_nama_barang = TextEditingController();
  final controller_varian = TextEditingController();
  final controller_harga_satuan = TextEditingController();
  final controller_id_supplier = TextEditingController();
  final controller_id_kategori = TextEditingController();
  final controller_expired_date = TextEditingController();
  final controller_min_stok = TextEditingController();
  final controller_max_stok = TextEditingController();

  @override
  void dispose() {
    controller_id_barang.dispose();
    controller_nama_barang.dispose();
    controller_varian.dispose();
    controller_harga_satuan.dispose();
    controller_id_supplier.dispose();
    controller_id_kategori.dispose();
    controller_min_stok.dispose();
    controller_max_stok.dispose();
    super.dispose();
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
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  "Tambah Data Barang",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              InputTextField(
                isable: true,
                keytype: TextInputType.text,
                tipe: "Id Barang",
                isPass: false,
                data: controller_id_barang,
              ),
              InputTextField(
                isable: true,
                keytype: TextInputType.text,
                tipe: "Nama barang",
                isPass: false,
                data: controller_nama_barang,
              ),
              InputTextField(
                isable: true,
                keytype: TextInputType.number,
                tipe: "Harga satuan",
                isPass: false,
                data: controller_harga_satuan,
              ),
              InputTextField(
                isable: true,
                keytype: TextInputType.text,
                tipe: "Varian",
                isPass: false,
                data: controller_varian,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                width: 270,
                height: 50,
                child: TextField(
                  onTap: () {
                    tanggal();
                  },
                  controller: controller_expired_date,
                  decoration: InputDecoration(
                      hintText: "expired date",
                      hintStyle:
                          TextStyle(color: Colors.grey[400], fontSize: 14),
                      prefixIcon: Icon(
                        Icons.date_range,
                        size: 25,
                        color: Colors.grey[400],
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 119, 119, 119))),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 0, 82, 72)))),
                  readOnly: true,
                ),
              ),
              InputTextField(
                isable: true,
                keytype: TextInputType.number,
                tipe: "Id kategori",
                isPass: false,
                data: controller_id_kategori,
              ),
              InputTextField(
                isable: true,
                keytype: TextInputType.number,
                tipe: "Id supplier",
                isPass: false,
                data: controller_id_supplier,
              ),
              InputTextField(
                isable: true,
                keytype: TextInputType.number,
                tipe: "min stok",
                isPass: false,
                data: controller_min_stok,
              ),
              InputTextField(
                isable: true,
                keytype: TextInputType.number,
                tipe: "max stok",
                isPass: false,
                data: controller_max_stok,
              ),
              Container(
                margin: const EdgeInsets.all(20),
                width: 150,
                height: 60,
                child: ElevatedButton(
                  onPressed: () => {
                    tambahBarang(
                        context,
                        controller_id_barang.text,
                        controller_nama_barang.text,
                        controller_harga_satuan.text,
                        controller_varian.text,
                        controller_expired_date.text,
                        controller_id_kategori.text,
                        controller_id_supplier.text,
                        controller_min_stok.text,
                        controller_max_stok.text),
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

  Future<void> tanggal() async {
    DateTime? pilih = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));
    if (pilih != Null) {
      setState(() {
        controller_expired_date.text = pilih.toString().split(" ")[0];
      });
    }
  }
}
