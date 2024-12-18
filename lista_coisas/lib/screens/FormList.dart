import 'package:flutter/material.dart';
import 'package:lista_coisas/components/InputText.dart';
import 'package:lista_coisas/components/ButtonSubmit.dart';
import 'package:lista_coisas/components/ListThings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Formlist extends StatefulWidget {
  Formlist({super.key});

  @override
  State<Formlist> createState() => _FormlistState();
}

class _FormlistState extends State<Formlist> {
  final TextEditingController _textController = TextEditingController();
  List<String> items = [];
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    _loadItems();
    _textController.addListener(() {
      if (errorMessage != null) {
        setState(() {
          errorMessage = null;
        });
      }
    });
  }

  void _addItemToList() {
    setState(() {
      if (_textController.text.isNotEmpty) {
        items.add(_textController.text);
        _saveItems();
        _textController.clear();
        errorMessage = null;
      } else {
        errorMessage = 'Preencha esse campo.';
      }
    });
  }

  // Carregar a lista salva na memória
  Future<void> _loadItems() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      items = prefs.getStringList('items') ??
          []; // Carregar a lista salva, ou uma lista vazia
    });
  }

  // Salvar a lista no shared preferences
  Future<void> _saveItems() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('items', items); // Salvar a lista no dispositivo
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('LISTA'),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('TELA DE LISTA DE PESSOAS COM FORMULARIO'),
            InputText(
              controller: _textController,
              errorMessageLength: errorMessage,
            ),
            Buttonsubmit(actionButton: _addItemToList),
            Listthings(itemsList: items),
          ],
        ),
      ),
    );
  }
}
