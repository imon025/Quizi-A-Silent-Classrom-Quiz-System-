import 'package:flutter/material.dart';

class StudentHome extends StatelessWidget {
  const StudentHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Welcome Student!",
          style: Theme.of(context).textTheme.headlineSmall, // fixed headline5 → headlineSmall
        ),
      ),
    );
  }
}
