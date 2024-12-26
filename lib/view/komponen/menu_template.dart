import 'package:flutter/material.dart';

class MenuTemplate extends StatelessWidget {
  final iconmenu;
  final String textmenu;
  const MenuTemplate({
    super.key,
    required this.iconmenu,
    required this.textmenu,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(right: 10, bottom: 10),
        width: 150,
        height: 200,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 249, 247, 247),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black, width: 1)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              iconmenu,
              size: 80,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                textmenu,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ));
  }
}
