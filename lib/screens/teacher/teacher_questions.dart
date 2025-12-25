import 'package:flutter/material.dart';
import '../../widgets/custom_textfield.dart';
import '../../widgets/custom_button.dart';
import '../../models/question.dart';

class TeacherQuestions extends StatefulWidget {
  const TeacherQuestions({super.key});

  static List<Question> questionBank = [];

  @override
  State<TeacherQuestions> createState() => _TeacherQuestionsState();
}

class _TeacherQuestionsState extends State<TeacherQuestions> {
  final q = TextEditingController();
  final a = TextEditingController();
  final b = TextEditingController();
  final c = TextEditingController();
  final d = TextEditingController();
  int correctIndex = 0;

  void addQuestion() {
    TeacherQuestions.questionBank.add(
      Question(
        question: q.text,
        options: [a.text, b.text, c.text, d.text],
        answerIndex: correctIndex,
      ),
    );
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Question Added")));
    q.clear();
    a.clear();
    b.clear();
    c.clear();
    d.clear();
    setState(() {
      correctIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          CustomTextField(controller: q, label: "Question"),
          const SizedBox(height: 10),
          CustomTextField(controller: a, label: "Option A"),
          const SizedBox(height: 10),
          CustomTextField(controller: b, label: "Option B"),
          const SizedBox(height: 10),
          CustomTextField(controller: c, label: "Option C"),
          const SizedBox(height: 10),
          CustomTextField(controller: d, label: "Option D"),
          const SizedBox(height: 15),
          DropdownButton<int>(
            value: correctIndex,
            items: const [
              DropdownMenuItem(value: 0, child: Text("Correct: Option A")),
              DropdownMenuItem(value: 1, child: Text("Correct: Option B")),
              DropdownMenuItem(value: 2, child: Text("Correct: Option C")),
              DropdownMenuItem(value: 3, child: Text("Correct: Option D")),
            ],
            onChanged: (val) {
              if (val != null) setState(() => correctIndex = val);
            },
          ),
          const SizedBox(height: 15),
          CustomButton(text: "Add Question", onTap: addQuestion),
        ],
      ),
    );
  }
}
