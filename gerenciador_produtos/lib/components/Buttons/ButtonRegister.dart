import 'package:flutter/material.dart';

class ButtonRegister extends StatefulWidget {
  const ButtonRegister({super.key});

  @override
  State<ButtonRegister> createState() => _ButtonRegisterState();
}

class _ButtonRegisterState extends State<ButtonRegister> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        // Ação do botão de cadastro
      },
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: Colors.black), // Borda preta
        foregroundColor: Colors.black, // Cor do texto preta
        padding: const EdgeInsets.symmetric(
            horizontal: 24, vertical: 12), // Espaçamento interno
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30), // Bordas arredondadas
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
