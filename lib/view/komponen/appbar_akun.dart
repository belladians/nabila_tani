import 'package:flutter/material.dart';

class AppBarAkun extends StatelessWidget implements PreferredSizeWidget {
  const AppBarAkun({
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
      elevation: 10,
      backgroundColor: const Color.fromARGB(255, 0, 82, 72),
    );
  }
}
