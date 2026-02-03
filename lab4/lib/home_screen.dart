import 'package:flutter/material.dart';
import 'exercises/exercise1/screens/core_widgets_demo.dart';
import 'exercises/exercise2/screens/input_widgets_demo.dart';
import 'exercises/exercise3/screens/layout_basics_demo.dart';
import 'exercises/exercise4/screens/app_structure_demo.dart';
import 'exercises/exercise5/screens/ui_fixes_demo.dart';

class HomeScreen extends StatelessWidget {
  final Function(bool) onThemeChanged;


  const HomeScreen({super.key, required this.onThemeChanged});


  Widget menuItem(BuildContext context, String title, Widget page) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: const Text('Demo'),
        trailing: const Icon(Icons.chevron_right),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => page),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lab 4 – Flutter UI Fundamentals')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            menuItem(context, 'Exercise 1 – Core Widgets', const Exercise1Core()),
            menuItem(context, 'Exercise 2 – Input Controls', const Exercise2Input()),
            menuItem(context, 'Exercise 3 – Layout Demo', const Exercise3Layout()),
            menuItem(context, 'Exercise 4 – App Structure & Theme', Exercise4App(onThemeChanged: onThemeChanged)),
            menuItem(context, 'Exercise 5 – Common UI Fixes', const Exercise5Fixes()),
          ],
        ),
      ),
    );
  }
}