import 'package:aplikasi_tani/service/service_cek_status.dart';
import 'package:aplikasi_tani/view/masterdata/masterdata_supplier_perbarui.dart';
import 'package:aplikasi_tani/view/komponen/toast.dart';
import 'package:aplikasi_tani/service/service_data_supplier.dart';
import 'package:flutter/material.dart';

class BuilderMenuSupplier extends StatelessWidget {
  final String id_supplier;
  final String nama_supplier;
  final String email;
  final String alamat_supplier;

  const BuilderMenuSupplier({
    super.key,
    required this.id_supplier,
    required this.nama_supplier,
    required this.email,
    required this.alamat_supplier,
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
                    customToast("Data supplier berhasil dihapus.",
                        Color.fromARGB(255, 69, 153, 107));
                    hapusSupplier(context, id_supplier);
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
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 0, 82, 72),
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
                    margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
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
                            builder: (context) => PerbaruiSupplier(
                                id_supplier: id_supplier,
                                nama_supplier: nama_supplier,
                                email: email,
                                alamat: alamat_supplier),
                          ));
                    } else if (cek == false) {
                      customToast(
                          "Anda tidak memiliki akses untuk melakukan ini.",
                          Colors.red);
                    }
                  },
                  child: Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.fromLTRB(0, 10, 15, 0),
                      decoration: BoxDecoration(
                          color: Colors.blueGrey[600],
                          borderRadius: BorderRadius.circular(10)),
                      child:
                          Icon(Icons.update, size: 30, color: Colors.yellow)),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Id supplier: $id_supplier",
                  style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w300,
                      color: Colors.white),
                ),
                Container(
                  width: 260,
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    "Nama supplier: $nama_supplier",
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
                Container(
                  width: 260,
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    "Email: $email",
                    style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w300,
                        color: Colors.white),
                  ),
                ),
                Container(
                  width: 260,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Text(
                      overflow: TextOverflow.fade,
                      "Alamat supplier: $alamat_supplier",
                      style: const TextStyle(
                          fontWeight: FontWeight.w300, color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ],
        ));
  }
}
