import 'package:flutter/material.dart';

void main() {
  runApp(const WFESCApp());
}

class WFESCApp extends StatelessWidget {
  const WFESCApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WFESC',
      theme: ThemeData.dark(),
      home: const WFESCHome(),
    );
  }
}

class WFESCHome extends StatelessWidget {
  const WFESCHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF050505),
      appBar: AppBar(
        title: const Text('WFESC'),
        backgroundColor: const Color(0xFF050505),
      ),
      body: const Center(
        child: Text(
          'WFESC',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
