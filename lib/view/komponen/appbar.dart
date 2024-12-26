import 'package:aplikasi_tani/view/account/account.dart';
import 'package:flutter/material.dart';

class AppBarComp extends StatelessWidget implements PreferredSizeWidget {
  const AppBarComp({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.white),
      title: const Padding(
        padding: EdgeInsets.only(left: 30, top: 10),
        child: Text(
          "Nabila Tani",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(
            right: 40,
            top: 8,
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AccountInformation()));
            },
            child: const Icon(
              Icons.account_circle,
              color: Colors.white,
              size: 40,
            ),
          ),
        )
      ],
      elevation: 10,
      backgroundColor: const Color.fromARGB(255, 0, 82, 72),
    );
  }
}
