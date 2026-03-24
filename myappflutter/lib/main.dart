import 'package:flutter/material.dart';
import 'screens/login_page.dart';

void main() {
  runApp(const ArrumaAiApp());
}

class ArrumaAiApp extends StatelessWidget {
  const ArrumaAiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Arruma-Ai',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}