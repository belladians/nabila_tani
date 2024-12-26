import 'package:aplikasi_tani/view/komponen/appbar_akun.dart';
import 'package:aplikasi_tani/view/komponen/builder_data_akun.dart';
import 'package:aplikasi_tani/service/service_akun.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AccountInformation extends StatefulWidget {
  const AccountInformation({super.key});

  @override
  State<AccountInformation> createState() => _AccountInformationState();
}

class _AccountInformationState extends State<AccountInformation> {
  List mylist = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarAkun(),
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Container(
            height: 400,
            child: FutureBuilder(
                future: dataAkun(mylist),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return ListView.builder(
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.all(10),
                            child: BuilderAkun(
                              nama_akun: mylist[index].nama_akun,
                              hak_akses: mylist[index].hak_akses,
                              no_hp: mylist[index].no_hp,
                            ),
                          );
                        });
                  } else {
                    return Center(
                      child: Text("tes"),
                    );
                  }
                }),
          ),
          SizedBox(
            height: 50,
          ),
          Center(
            child: GestureDetector(
              onTap: () async {
                // SharedPreferences preferences =
                //     await SharedPreferences.getInstance();
                FlutterSecureStorage storage = FlutterSecureStorage();
                // await preferences.clear();
                await storage.delete(key: "user");
                Navigator.pushNamedAndRemoveUntil(
                    context, '/login', (route) => false);
              },
              child: Container(
                  width: 100,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 0, 82, 72)),
                  child: Center(
                      child: Text(
                    "logout",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ))),
            ),
          ),
        ],
      ),
    );
  }
}
