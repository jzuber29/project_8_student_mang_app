import 'package:flutter/material.dart';
import '../models/student.dart';

class StudentDetailScreen extends StatelessWidget {
  final Student student;

  const StudentDetailScreen({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(student.name)),
      body: Center(
        child: Text(
          "${student.name} is ${student.age} years old.",
          style: const TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}
