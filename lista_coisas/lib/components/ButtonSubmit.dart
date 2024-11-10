import 'package:flutter/material.dart';

class Buttonsubmit extends StatefulWidget {
  const Buttonsubmit({super.key, this.actionButton});
  final actionButton;

  @override
  State<Buttonsubmit> createState() => _ButtonsubmitState();
}

class _ButtonsubmitState extends State<Buttonsubmit> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ElevatedButton(
        onPressed: widget.actionButton,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          overlayColor: Colors.grey,
        ),
        child: const Text(
          'CONFIRMAR',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
