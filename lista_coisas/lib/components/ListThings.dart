import 'package:flutter/material.dart';
import 'package:lista_coisas/components/EditDialog.dart';
import 'package:lista_coisas/components/DeleteOptionSheet.dart';

class Listthings extends StatefulWidget {
  const Listthings({super.key, required this.itemsList});
  final List<String> itemsList;

  @override
  State<Listthings> createState() => _ListthingsState();
}

class _ListthingsState extends State<Listthings> {
  void _showEditItemDialog(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return EditDialog(
          initialText: widget.itemsList[index],
          onSave: (newText) {
            setState(() {
              widget.itemsList[index] = newText;
            });
          },
        );
      },
    );
  }

  void _showDeleteSheet(int index) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return DeleteOptionSheet(
          itemName: widget.itemsList[index],
          onDelete: () {
            setState(() {
              widget.itemsList.removeAt(index);
            });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: widget.itemsList.length,
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: 150,
            child: ListTile(
              leading: Icon(Icons.label),
              title: Text(widget.itemsList[index]),
              onTap: () {
                _showEditItemDialog(index);
              },
              onLongPress: () {
                _showDeleteSheet(index);
              },
            ),
          );
        },
      ),
    );
  }
}
