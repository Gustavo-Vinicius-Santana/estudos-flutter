import 'package:flutter/material.dart';

class Listproduct extends StatefulWidget {
  const Listproduct({super.key});

  @override
  State<Listproduct> createState() => _ListproductState();
}

class _ListproductState extends State<Listproduct> {
  // Inicializa a lista de produtos
  late List<Map<String, dynamic>> listaProdutos = [
    {
      'nome': 'teste',
      'preco': 50.0,
      'quantidade': 2,
      'descricao': 'descrição teste'
    },
    {
      'nome': 'produto 2',
      'preco': 75.0,
      'quantidade': 1,
      'descricao': 'Descrição teste'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Center(
        child: Text('Lista de Produtos'),
      )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: listaProdutos.length,
              itemBuilder: (context, index) {
                final produto = listaProdutos[index];
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
          ),
        ],
      ),
    );
  }
}
