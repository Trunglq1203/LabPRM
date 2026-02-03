import 'package:flutter/material.dart';


class Exercise4App extends StatelessWidget {
  final Function(bool) onThemeChanged;


  const Exercise4App({super.key, required this.onThemeChanged});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 4 – App Structure'),
        actions: [
          Switch(value: Theme.of(context).brightness == Brightness.dark, onChanged: onThemeChanged)
        ],
      ),
      body: const Center(child: Text('This is a simple screen with theme toggle.')),
    );
  }
}