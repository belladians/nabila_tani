import 'package:aplikasi_tani/service/service_cek_status.dart';
import 'package:aplikasi_tani/view/komponen/appbar.dart';
import 'package:aplikasi_tani/view/komponen/builder_data_supplier.dart';
import 'package:aplikasi_tani/service/service_data_supplier.dart';
import 'package:aplikasi_tani/view/masterdata/masterdata_supplier_tambah.dart';
import 'package:flutter/material.dart';

class MasterDataSupplier extends StatefulWidget {
  const MasterDataSupplier({super.key});

  @override
  State<MasterDataSupplier> createState() => _MasterDataSupplierState();
}

class _MasterDataSupplierState extends State<MasterDataSupplier> {
  final controller_id = TextEditingController();
  List mylist = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarComp(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                "Data Supplier",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
                child: FutureBuilder(
              future: dataSupplier(mylist),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return ListView.builder(
                      itemCount: mylist.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin:
                              EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                          child: BuilderMenuSupplier(
                            id_supplier: mylist[index].id_supplier,
                            nama_supplier: mylist[index].nama_supplier,
                            email: mylist[index].email,
                            alamat_supplier: mylist[index].alamat_supplier,
                          ),
                        );
                      });
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var cek = await cekStatus();
          if (cek == true) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => TambahSupplier()));
          }
          FocusScope.of(context).unfocus();
        },
        backgroundColor: const Color.fromARGB(255, 0, 123, 109),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
