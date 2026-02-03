import 'package:flutter/material.dart';


class FixSetState extends StatefulWidget {
  const FixSetState({super.key});


  @override
  State<FixSetState> createState() => _FixSetStateState();
}


class _FixSetStateState extends State<FixSetState> {
  int counter = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fix missing setState()')),
      body: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Text('Counter: $counter', style: const TextStyle(fontSize: 24)),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              setState(() {
                counter++;
              });
            },
            child: const Text('Increase'),
          )
        ]),
      ),
    );
  }
}