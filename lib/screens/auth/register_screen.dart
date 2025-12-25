import 'package:flutter/material.dart';
import 'login_screen.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool loading = false;

  void _register() {
    // Dummy register action
    setState(() => loading = true);
    Future.delayed(const Duration(seconds: 2), () {
      setState(() => loading = false);
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Registered Successfully")));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => LoginScreen(onThemeToggle: () {}), // remove const
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(controller: nameController, label: "Name"),
              const SizedBox(height: 10),
              CustomTextField(controller: emailController, label: "Email"),
              const SizedBox(height: 10),
              CustomTextField(controller: passwordController, label: "Password", obscure: true),
              const SizedBox(height: 20),
              CustomButton(
                text: loading ? "Loading..." : "Register",
                onTap: _register,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
