import 'package:flutter/material.dart';
import 'package:projeto_android/screens/DashBoard.dart';
import 'package:projeto_android/screens/ListProduct.dart';
import 'package:projeto_android/screens/RegisterProduct.dart';
import 'package:projeto_android/services/ProductService.dart';

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
  int _selectedIndex = 1;

  ProductService productService = ProductService();

  @override
  void initState() {
    super.initState();
    _screens = [
      Registerproduct(
        registerProduct: productService.addProduct,
      ),
      Listproduct(
        products: productService.getProducts(),
        onEditProduct: productService.editProduct,
        onDeleteProduct: productService.deleteProduct,
      ),
      DashboardScrren(),
    ];
  }

  void _onItemSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
