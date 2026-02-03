import 'package:flutter/material.dart';


class FixOverflowScroll extends StatelessWidget {
  const FixOverflowScroll({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fix Overflow with ScrollView')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: List.generate(
            20,
                (index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text('Long content line ${index + 1}', style: const TextStyle(fontSize: 18)),
            ),
          ),
        ),
      ),
    );
  }
}