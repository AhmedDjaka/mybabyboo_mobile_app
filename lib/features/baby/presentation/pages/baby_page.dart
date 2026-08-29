import 'package:flutter/material.dart';

class BabyPage extends StatelessWidget {
  const BabyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bébé')),
      body: const Center(
        child: Text(
          'Bébé\nModule à implémenter',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, color: Color(0xFF7A5A7B)),
        ),
      ),
    );
  }
}
