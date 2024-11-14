import 'package:flutter/material.dart';
import 'package:projeto_android/screens/DashBoard.dart';
import 'package:projeto_android/screens/ListProduct.dart';
import 'package:projeto_android/screens/RegisterProduct.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Lista de produtos
  final List<Map<String, dynamic>> listMainAllProducts = [
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

  int _selectedIndex = 1;

  @override
  void initState() {
    super.initState();
    _screens = [
      Registerproduct(),
      Listproduct(
        listAllProducts: listMainAllProducts,
      ),
      DashboardScrren(),
    ];
  }

  // Index de uma tela
  void _onItemSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Lista de widgets das telas
  late List<Widget> _screens;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Center(
          child: Text(
            'GERENCIADOR DE PRODUTOS',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'adicionar item',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Lista',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemSelected,
      ),
    );
  }
}
