import 'package:flutter/material.dart';
import 'package:stopwatch_challenge/views/screens/home/home_screen.dart';

void main() {
  runApp(const Stopwatch());
}

class Stopwatch extends StatelessWidget {
  const Stopwatch({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stopwatch',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
