import 'package:flutter/material.dart';

class UniversePage extends StatelessWidget {
  const UniversePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mon Univers')),
      body: const Center(
        child: Text(
          'Mon Univers\n(En construction)',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
