import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'screens/auth/login_screen.dart';
import 'theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const QuiziApp());
}

class QuiziApp extends StatefulWidget {
  const QuiziApp({super.key});

  @override
  State<QuiziApp> createState() => _QuiziAppState();
}

class _QuiziAppState extends State<QuiziApp> {
  bool isDark = false;

  void toggleTheme() {
    setState(() => isDark = !isDark);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quizi',
      debugShowCheckedModeBanner: false,
      theme: isDark ? AppTheme.darkTheme : AppTheme.lightTheme,
      home: LoginScreen(onThemeToggle: toggleTheme),
    );
  }
}
