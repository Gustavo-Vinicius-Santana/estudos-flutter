import 'package:flutter/material.dart';

class Listthings extends StatefulWidget {
  const Listthings({super.key, required this.itemsList});
  final List<String> itemsList;

  @override
  State<Listthings> createState() => _ListthingsState();
}

class _ListthingsState extends State<Listthings> {
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
                print('Clicou na lista.');
              },
            ),
          );
        },
      ),
    );
  }
}
