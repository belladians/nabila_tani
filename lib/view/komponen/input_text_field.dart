import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  final String tipe;
  final isable;
  final iconTextField;
  final isPass;
  final data;
  final keytype;
  const InputTextField({
    super.key,
    required this.isable,
    required this.tipe,
    required this.isPass,
    required this.keytype,
    this.iconTextField,
    this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      height: 50,
      width: 270,
      child: TextField(
        
        enabled: isable,
        keyboardType: keytype,
        controller: data,
        obscureText: isPass,
        decoration: InputDecoration(
            hintText: tipe,
            hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
            prefixIcon: Icon(
              iconTextField,
              size: 25,
              color: Colors.grey[400],
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                    color: Color.fromARGB(255, 119, 119, 119))),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    const BorderSide(color: Color.fromARGB(255, 0, 82, 72)))),
      ),
    );
  }
}
