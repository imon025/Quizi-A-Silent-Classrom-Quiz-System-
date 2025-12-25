import 'package:flutter/material.dart';
import '../../models/question.dart';
import '../../screens/teacher/teacher_questions.dart';

class StudentQuiz extends StatefulWidget {
  const StudentQuiz({super.key});

  @override
  State<StudentQuiz> createState() => _StudentQuizState();
}

class _StudentQuizState extends State<StudentQuiz> {
  int score = 0;
  int currentIndex = 0;
  int? selected;

  List<Question> questions = TeacherQuestions.questionBank;

  void next() {
    if (selected != null &&
        selected == questions[currentIndex].answerIndex) score++;

    if (currentIndex + 1 < questions.length) {
      setState(() {
        currentIndex++;
        selected = null;
      });
    } else {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text("Quiz Completed"),
          content: Text("Your score: $score/${questions.length}"),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  setState(() {
                    currentIndex = 0;
                    score = 0;
                  });
                },
                child: const Text("OK"))
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (questions.isEmpty) {
      return const Center(child: Text("No questions available"));
    }
    final q = questions[currentIndex];
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Q${currentIndex + 1}: ${q.question}", style: const TextStyle(fontSize: 18)),
          const SizedBox(height: 15),
          ...List.generate(q.options.length, (i) {
            return RadioListTile<int>(
              value: i,
              groupValue: selected,
              title: Text(q.options[i]),
              onChanged: (val) => setState(() => selected = val),
            );
          }),
          const SizedBox(height: 15),
          ElevatedButton(onPressed: next, child: const Text("Next"))
        ],
      ),
    );
  }
}
