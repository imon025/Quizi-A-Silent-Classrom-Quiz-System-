import 'package:flutter/material.dart';
import '../../widgets/custom_textfield.dart';
import '../../widgets/custom_button.dart';
import 'register_screen.dart';
import '../../models/user_role.dart';
import '../../screens/teacher/teacher_dashboard.dart';
import '../../screens/student/student_dashboard.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  final VoidCallback onThemeToggle;
  const LoginScreen({super.key, required this.onThemeToggle});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  UserRole? role;

  void login() {
    if (emailController.text.isEmpty || passwordController.text.isEmpty || role == null) {
      Fluttertoast.showToast(msg: "Please fill all fields & select role");
      return;
    }
    if (role == UserRole.teacher) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const TeacherDashboard()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const StudentDashboard()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextField(controller: emailController, label: "Email"),
              const SizedBox(height: 15),
              CustomTextField(controller: passwordController, label: "Password", obscure: true),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ChoiceChip(
                    label: const Text("Teacher"),
                    selected: role == UserRole.teacher,
                    onSelected: (_) => setState(() => role = UserRole.teacher),
                  ),
                  const SizedBox(width: 10),
                  ChoiceChip(
                    label: const Text("Student"),
                    selected: role == UserRole.student,
                    onSelected: (_) => setState(() => role = UserRole.student),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              CustomButton(text: "Login", onTap: login),
              const SizedBox(height: 15),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const RegisterScreen()),
                  );
                },
                child: const Text(
                  "Create Account",
                  style: TextStyle(decoration: TextDecoration.underline, color: Colors.blue),
                ),
              ),
              const SizedBox(height: 20),
              IconButton(
                  onPressed: widget.onThemeToggle,
                  icon: const Icon(Icons.brightness_6))
            ],
          ),
        ),
      ),
    );
  }
}
