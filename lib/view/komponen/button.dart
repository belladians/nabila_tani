import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final double lebar;
  final double tinggi;
  final String textButton;
  const Button({
    super.key,
    required this.lebar,
    required this.tinggi,
    required this.textButton,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: lebar,
      height: tinggi,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 0, 82, 72),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        child: Text(
          textButton,
          style: const TextStyle(fontSize: 15, color: Colors.white),
        ),
      ),
    );
  }
}
