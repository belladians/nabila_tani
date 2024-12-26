import 'package:aplikasi_tani/service/service_login.dart';
import 'package:flutter/material.dart';
import 'view/komponen/input_text_field.dart';

class HalamanLogin extends StatefulWidget {
  const HalamanLogin({super.key});

  @override
  State<HalamanLogin> createState() => _StateHalamanLogin();
}

class _StateHalamanLogin extends State<HalamanLogin> {
  final controller_username = TextEditingController();
  final controller_password = TextEditingController();

  @override
  void dispose() {
    controller_username.dispose();
    controller_password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          alignment: Alignment.topLeft,
          children: [
            // lapisan 1
            Container(
              width: double.infinity,
              height: double.infinity,
              color: const Color.fromARGB(255, 0, 82, 72),
            ),

            const Padding(
              padding: EdgeInsets.only(top: 50, left: 40),
              child: Text(
                "S E L A M A T\nD A T A N G",
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // lapisan 2
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        "Nabila Tani",
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 11, 5),
                            fontFamily: 'Montserrat',
                            fontSize: 30,
                            fontWeight: FontWeight.w600),
                      ),
                      const Text(
                        'Aplikasi Pencatatan Barang',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w300),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Icon(
                        Icons.inventory_rounded,
                        size: 130,
                        color: Color.fromARGB(255, 0, 82, 72),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InputTextField(
                        isable: true,
                        keytype: TextInputType.text,
                        tipe: "Username",
                        iconTextField: Icons.account_circle_outlined,
                        isPass: false,
                        data: controller_username,
                      ),
                      InputTextField(
                        isable: true,
                        keytype: TextInputType.text,
                        tipe: "Password",
                        iconTextField: Icons.lock_outline_rounded,
                        isPass: true,
                        data: controller_password,
                      ),
                      Container(
                        margin: const EdgeInsets.all(20),
                        width: 150,
                        height: 60,
                        child: ElevatedButton(
                          onPressed: () => {
                            login(context, controller_username.text,
                                controller_password.text)
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 0, 82, 72),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          child: const Text(
                            "Login",
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
