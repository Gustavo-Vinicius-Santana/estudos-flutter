import 'package:flutter/material.dart';

class ButtonRegister extends StatefulWidget {
  const ButtonRegister({super.key, required this.register});
  final register;

  @override
  State<ButtonRegister> createState() => _ButtonRegisterState();
}

class _ButtonRegisterState extends State<ButtonRegister> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: widget.register,
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: Colors.black),
        foregroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: const Text(
        'CADASTRAR',
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
