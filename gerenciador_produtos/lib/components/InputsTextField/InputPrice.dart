import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputPrice extends StatefulWidget {
  const InputPrice({super.key});

  @override
  State<InputPrice> createState() => _InputPriceState();
}

class _InputPriceState extends State<InputPrice> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.3,
      child: TextFormField(
        decoration: InputDecoration(
          labelText: 'PREÇO',
          prefix: const Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Text(
              'R\$ -',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.blueGrey,
          ),
          contentPadding: const EdgeInsets.only(bottom: 8),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 2),
          ),
        ),
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'^-?[0-9]+(\.[0-9]*)?$')),
        ],
      ),
    );
  }
}
