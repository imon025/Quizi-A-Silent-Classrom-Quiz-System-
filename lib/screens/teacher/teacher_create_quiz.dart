import 'package:flutter/material.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield.dart';
import '../../models/question.dart';
import 'teacher_questions.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TeacherCreateQuiz extends StatefulWidget {
  const TeacherCreateQuiz({super.key});

  @override
  State<TeacherCreateQuiz> createState() => _TeacherCreateQuizState();
}

class _TeacherCreateQuizState extends State<TeacherCreateQuiz> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  void createQuiz() {
    if (titleController.text.isEmpty || descriptionController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please fill all fields");
      return;
    }
    Fluttertoast.showToast(msg: "Quiz Created: ${titleController.text}");
    titleController.clear();
    descriptionController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          CustomTextField(controller: titleController, label: "Quiz Title"),
          const SizedBox(height: 15),
          CustomTextField(controller: descriptionController, label: "Quiz Description"),
          const SizedBox(height: 20),
          CustomButton(text: "Create Quiz", onTap: createQuiz),
        ],
      ),
    );
  }
}
