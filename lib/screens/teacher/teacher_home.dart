import 'package:flutter/material.dart';

class TeacherHome extends StatelessWidget {
  const TeacherHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Welcome Teacher!",
          style: Theme.of(context).textTheme.headlineSmall, // fixed headline5 → headlineSmall
        ),
      ),
    );
  }
}
