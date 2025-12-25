import 'package:flutter/material.dart';
import 'teacher_home.dart';
import 'teacher_create_quiz.dart';
import 'teacher_questions.dart';

class TeacherDashboard extends StatefulWidget {
  const TeacherDashboard({super.key});

  @override
  State<TeacherDashboard> createState() => _TeacherDashboardState();
}

class _TeacherDashboardState extends State<TeacherDashboard> {
  int selectedIndex = 0;

  final screens = [
    const TeacherHome(),
    const TeacherQuestions(),
    const TeacherCreateQuiz(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Teacher Dashboard")),
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (i) => setState(() => selectedIndex = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "Questions"),
          BottomNavigationBarItem(icon: Icon(Icons.quiz), label: "Create Quiz"),
        ],
      ),
    );
  }
}
