import 'package:flutter/material.dart';
import '../models/student.dart';
import 'add_student_screen.dart';
import 'student_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Student> _students = [];

  void _addStudent(Student student) {
    setState(() {
      _students.add(student);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Students')),
      body: ListView.builder(
        itemCount: _students.length,
        itemBuilder: (ctx, index) {
          final student = _students[index];
          return ListTile(
            title: Text(student.name),
            subtitle: Text("Age: ${student.age}"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => StudentDetailScreen(student: student),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newStudent = await Navigator.push<Student>(
            context,
            MaterialPageRoute(
              builder: (_) => AddStudentScreen(),
            ),
          );
          if (newStudent != null) {
            _addStudent(newStudent);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
