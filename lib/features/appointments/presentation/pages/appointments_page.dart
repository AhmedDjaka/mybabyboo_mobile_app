import 'package:flutter/material.dart';

class AppointmentsPage extends StatelessWidget {
  const AppointmentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rendez-vous')),
      body: const Center(
        child: Text(
          'Rendez-vous\nModule à implémenter',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, color: Color(0xFF7A5A7B)),
        ),
      ),
    );
  }
}
