import 'package:aplikasi_tani/view/komponen/appbar.dart';
import 'package:aplikasi_tani/view/komponen/input_text_field.dart';
import 'package:aplikasi_tani/service/service_data_barang.dart';
import 'package:flutter/material.dart';

class PerbaruiBarang extends StatefulWidget {
  final id_barang;
  final nama_barang;
  final varian;
  final harga_satuan;
  final min_stok;
  final id_supplier;
  final id_kategori;
  final expired_date;
  final max_stok;
  const PerbaruiBarang(
      {super.key,
      required this.id_barang,
      required this.nama_barang,
      required this.varian,
      required this.harga_satuan,
      required this.min_stok,
      required this.id_supplier,
      required this.id_kategori,
      required this.expired_date,
      required this.max_stok});

  @override
  State<PerbaruiBarang> createState() => _PerbaruiBarangState();
}

class _PerbaruiBarangState extends State<PerbaruiBarang> {
  late TextEditingController controller_varian;
  late TextEditingController controller_harga_satuan;
  late TextEditingController controller_id_supplier;
  late TextEditingController controller_id_kategori;
  late TextEditingController controller_expired_date;
  late TextEditingController controller_min_stok;
  late TextEditingController controller_id_barang;
  late TextEditingController controller_nama_barang;
  late TextEditingController controller_max_stok;

  @override
  void dispose() {
    controller_id_barang.dispose();
    controller_nama_barang.dispose();
    controller_varian.dispose();
    controller_harga_satuan.dispose();
    controller_expired_date.dispose();
    controller_id_supplier.dispose();
    controller_id_kategori.dispose();
    controller_min_stok.dispose();
    controller_max_stok.dispose();
    super.dispose();
  }

  void initState() {
    super.initState();
    controller_id_barang = TextEditingController(text: widget.id_barang);
    controller_nama_barang = TextEditingController(text: widget.nama_barang);
    controller_harga_satuan = TextEditingController(text: widget.harga_satuan);
    controller_varian = TextEditingController(text: widget.varian);
    controller_min_stok = TextEditingController(text: widget.min_stok);
    controller_expired_date = TextEditingController(text: widget.expired_date);
    controller_id_kategori = TextEditingController(text: widget.id_kategori);
    controller_id_supplier = TextEditingController(text: widget.id_supplier);
    controller_max_stok = TextEditingController(text: widget.max_stok);
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
                  "Perbarui Data Barang",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              InputTextField(
                isable: false,
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
                keytype: TextInputType.text,
                tipe: "id_supplier",
                isPass: false,
                data: controller_id_supplier,
              ),
              InputTextField(
                isable: true,
                keytype: TextInputType.text,
                tipe: "id_kategori",
                isPass: false,
                data: controller_id_kategori,
              ),
              InputTextField(
                isable: true,
                keytype: TextInputType.number,
                tipe: "min_stok",
                isPass: false,
                data: controller_min_stok,
              ),
              InputTextField(
                isable: true,
                keytype: TextInputType.number,
                tipe: "max_stok",
                isPass: false,
                data: controller_max_stok,
              ),
              Container(
                margin: const EdgeInsets.all(20),
                width: 150,
                height: 60,
                child: ElevatedButton(
                  onPressed: () => {
                    perbaruiBarang(
                      context,
                      controller_id_barang.text.toString(),
                      controller_nama_barang.text.toString(),
                      controller_harga_satuan.text.toString(),
                      controller_varian.text.toString(),
                      controller_expired_date.text.toString(),
                      controller_id_kategori.text.toString(),
                      controller_id_supplier.text.toString(),
                      controller_min_stok.text.toString(),
                      controller_max_stok.text.toString(),
                    ),
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
