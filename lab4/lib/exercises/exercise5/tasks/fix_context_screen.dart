import 'package:flutter/material.dart';


class FixDatePickerContext extends StatelessWidget {
  const FixDatePickerContext({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fix DatePicker Context')),
      body: Center(
        child: ElevatedButton(
          child: const Text('Open Date Picker'),
          onPressed: () async {
            await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
            );
          },
        ),
      ),
    );
  }
}