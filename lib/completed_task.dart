import 'package:crud_application_firebase/read_task.dart';
import 'package:flutter/material.dart';

class CompletedTask extends StatelessWidget {
   CompletedTask({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ReadTask(true),
    );
  }
}
