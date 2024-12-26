import 'package:aplikasi_tani/service/service_cek_status.dart';
import 'package:aplikasi_tani/view/masterdata/masterdata_barang_perbarui.dart';
import 'package:aplikasi_tani/view/komponen/toast.dart';
import 'package:aplikasi_tani/service/service_data_barang.dart';
import 'package:flutter/material.dart';

class BuilderMenu extends StatelessWidget {
  final String id_barang;
  final String nama_barang;
  final String harga_satuan;
  final String varian;
  final String stok;
  final String id_supplier;
  final String id_kategori;
  final String max_stok;
  final String min_stok;
  final String expired_date;

  const BuilderMenu({
    super.key,
    required this.id_barang,
    required this.nama_barang,
    required this.harga_satuan,
    required this.varian,
    required this.stok,
    required this.id_supplier,
    required this.id_kategori,
    required this.max_stok,
    required this.min_stok,
    required this.expired_date,
  });
  @override
  Widget build(BuildContext context) {
    Future<bool> dialogHapus(BuildContext context) async {
      return (await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text("Hapus"),
              content: Text("Apakah anda yakin ingin menghapus?"),
              actions: [
                TextButton(
                  onPressed: () {
                    customToast("Data barang berhasil dihapus.",
                        Color.fromARGB(255, 69, 153, 107));
                    hapusBarang(context, id_barang);
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

    return Container(
      height: 300,
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 0, 82, 72),
          borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          Column(
            children: [
              GestureDetector(
                onTap: () async {
                  var cek = await cekStatus();
                  if (cek == true) {
                    dialogHapus(context);
                  }
                  FocusScope.of(context).unfocus();
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 30, 15, 0),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(10)),
                  child: Icon(
                    Icons.delete,
                    size: 30,
                    color: Colors.red,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  var cek = await cekStatus();
                  if (cek == true) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PerbaruiBarang(
                            id_barang: id_barang,
                            nama_barang: nama_barang,
                            min_stok: min_stok,
                            harga_satuan: harga_satuan,
                            varian: varian,
                            expired_date: expired_date,
                            id_kategori: id_kategori,
                            id_supplier: id_supplier,
                            max_stok: max_stok,
                          ),
                        ));
                  } else if (cek == false) {
                    customToast(
                        "Anda tidak memiliki akses untuk melakukan ini.",
                        Colors.red);
                  }
                },
                child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.fromLTRB(0, 20, 15, 0),
                    decoration: BoxDecoration(
                        color: Colors.blueGrey[600],
                        borderRadius: BorderRadius.circular(10)),
                    child: Icon(Icons.update, size: 30, color: Colors.yellow)),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "ID: $id_barang",
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              Text("Nama: $nama_barang",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w300,
                      color: Colors.white)),
              Text(
                "Varian: $varian",
                style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w300,
                    color: Colors.white),
              ),
              Text(
                "Harga satuan: Rp.$harga_satuan",
                style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w300,
                    color: Colors.white),
              ),
              Text(
                "id supplier: $id_supplier",
                style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w300,
                    color: Colors.white),
              ),
              Text(
                "expired: $expired_date",
                style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w300,
                    color: Colors.white),
              ),
              Text(
                "Minimal stok: $min_stok",
                style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w300,
                    color: Colors.white),
              ),
              Text(
                "Maksimal stok: $max_stok",
                style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w300,
                    color: Colors.white),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: Text(
                  "Stok: $stok",
                  style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w300,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
