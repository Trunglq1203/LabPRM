import 'package:flutter/material.dart';
import '../tasks/fix_listview_screen.dart';
import '../tasks/fix_overflow_screen.dart';
import '../tasks/fix_state_screen.dart';
import '../tasks/fix_context_screen.dart';

class Exercise5Fixes extends StatelessWidget {
  const Exercise5Fixes({super.key});


  Widget fixButton(BuildContext context, String title, Widget page) {
    return ListTile(
      leading: const Icon(Icons.build),
      title: Text(title),
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => page)),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exercise 5 – Common UI Fixes')),
      body: Column(children: [
        fixButton(context, 'Fix ListView inside Column (Expanded)', const FixListViewExpanded()),
        fixButton(context, 'Fix Overflow with ScrollView', const FixOverflowScroll()),
        fixButton(context, 'Fix setState Issue', const FixSetState()),
        fixButton(context, 'Fix DatePicker Context', const FixDatePickerContext()),
      ]),
    );
  }
}