import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int cont = 0;

  void _decrementCounter() {
    setState(() {
      cont--;
    });
  }

  void _incrementCounter() {
    setState(() {
      cont++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('CONTADOR APP'),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                  'Clique nos botões abaixo para adiconar ou subtrair um numero do contador',
                  style: TextStyle(fontSize: 16)),
            ),
            Center(
              child: Text(
                '$cont',
                style: const TextStyle(fontSize: 30),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Stack(
        children: [
          Positioned(
              left: 16.0, // Posiciona o botão na esquerda
              bottom: 16.0,
              child: FloatingActionButton(
                onPressed: _decrementCounter,
                tooltip: 'Decrementar',
                child: const Icon(Icons.remove),
              )),
          Positioned(
              right: 16.0,
              bottom: 16.0,
              child: FloatingActionButton(
                onPressed: _incrementCounter,
                tooltip: 'Incrementar',
                child: const Icon(Icons.add),
              ))
        ],
      ),
    );
  }
}
