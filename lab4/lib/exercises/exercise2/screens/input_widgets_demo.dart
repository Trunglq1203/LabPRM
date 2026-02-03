import 'package:flutter/material.dart';


class Exercise2Input extends StatefulWidget {
  const Exercise2Input({super.key});


  @override
  State<Exercise2Input> createState() => _Exercise2InputState();
}


class _Exercise2InputState extends State<Exercise2Input> {
  double rating = 50;
  bool active = false;
  String? genre;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exercise 2 – Input Controls')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('Rating (Slider)'),
          Slider(value: rating, min: 0, max: 100, onChanged: (v) => setState(() => rating = v)),
          Text('Current value: ${rating.toInt()}'),
          const SizedBox(height: 16),
          const Text('Active (Switch)'),
          SwitchListTile(title: const Text('Is movie active?'), value: active, onChanged: (v) => setState(() => active = v)),
          const SizedBox(height: 16),
          const Text('Genre (RadioListTile)'),
          RadioListTile(title: const Text('Action'), value: 'Action', groupValue: genre, onChanged: (v) => setState(() => genre = v)),
          RadioListTile(title: const Text('Comedy'), value: 'Comedy', groupValue: genre, onChanged: (v) => setState(() => genre = v)),
          Text('Selected genre: ${genre ?? "None"}'),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () async {
              await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2000), lastDate: DateTime(2100));
            },
            child: const Text('Open Date Picker'),
          )
        ]),
      ),
    );
  }
}