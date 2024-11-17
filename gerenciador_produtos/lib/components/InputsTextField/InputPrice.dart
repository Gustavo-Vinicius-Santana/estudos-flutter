import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputPrice extends StatefulWidget {
  const InputPrice({super.key, required this.controller, this.errorMessage});
  final TextEditingController controller;
  final String? errorMessage;

  @override
  State<InputPrice> createState() => _InputPriceState();
}

class _InputPriceState extends State<InputPrice> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.3,
      child: TextFormField(
        controller: widget.controller,
        decoration: InputDecoration(
          labelText: 'PREÇO',
          hintText: '50.00',
          error: widget.errorMessage != null
              ? Text(
                  widget.errorMessage!,
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                )
              : null,
          hintStyle: const TextStyle(color: Colors.grey),
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
