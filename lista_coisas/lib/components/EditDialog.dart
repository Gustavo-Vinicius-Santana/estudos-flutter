import 'package:flutter/material.dart';
import 'package:lista_coisas/components/InputText.dart';

class EditDialog extends StatefulWidget {
  final String initialText;
  final ValueChanged<String> onSave;

  const EditDialog({
    super.key,
    required this.initialText,
    required this.onSave,
  });

  @override
  _EditDialogState createState() => _EditDialogState();
}

class _EditDialogState extends State<EditDialog> {
  String? errorMessage;
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialText);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  saveSubmit() {
    if (_controller.text.isNotEmpty) {
      widget.onSave(_controller.text);
      Navigator.of(context).pop();
    } else {
      setState(() {
        errorMessage = "preencha esse campo";
      });
    }
  }

  cancelSubmit() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Editar Item'),
      content: InputText(
        controller: _controller,
        errorMessageLength: errorMessage,
      ),
      actions: [
        TextButton(
          onPressed: cancelSubmit,
          child: const Text('Cancelar'),
        ),
        TextButton(
          onPressed: saveSubmit,
          child: const Text('Salvar'),
        ),
      ],
    );
  }
}
