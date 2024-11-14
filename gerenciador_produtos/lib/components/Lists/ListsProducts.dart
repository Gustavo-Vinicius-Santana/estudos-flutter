import 'package:flutter/material.dart';

class Listsproducts extends StatefulWidget {
  const Listsproducts({super.key, required this.mainList});

  final List mainList;

  @override
  State<Listsproducts> createState() => _ListsproductsState();
}

class _ListsproductsState extends State<Listsproducts> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: widget.mainList.length,
        itemBuilder: (context, index) {
          final produto = widget.mainList[index];
          return ExpansionTile(
            title: Text(
              produto['nome'],
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              'Preço: R\$ ${produto['preco'].toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.green, // Alterando a cor do preço
              ),
            ),
            leading: const Icon(Icons.shopping_bag),
            children: [
              ListTile(
                  title: Row(
                children: [
                  const Text(
                    'Quantidade:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '${produto['quantidade']}',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.blue,
                    ),
                  )
                ],
              )),
              ListTile(
                title: const Text(
                  'Descrição: ',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600, // Título em negrito
                  ),
                ),
                subtitle: Text(produto['descricao']),
              ),
            ],
          );
        },
      ),
    );
  }
}
