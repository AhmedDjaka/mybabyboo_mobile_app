import 'package:flutter/material.dart';

class HealthPage extends StatelessWidget {
  const HealthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Santé')),
      body: const Center(
        child: Text(
          'Santé\nModule à implémenter',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, color: Color(0xFF7A5A7B)),
        ),
      ),
    );
  }
}
