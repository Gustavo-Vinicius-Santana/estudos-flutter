import 'package:flutter/material.dart';

class DashboardScrren extends StatefulWidget {
  const DashboardScrren({super.key});

  @override
  State<DashboardScrren> createState() => _DashboardScrrenState();
}

class _DashboardScrrenState extends State<DashboardScrren> {
  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('DASHBOARD'),
      ],
    );
  }
}
