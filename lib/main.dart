import 'package:flutter/material.dart';
import 'package:imc_app/core/theme/app_theme.dart';
import 'package:imc_app/presentation/home/home.page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IMC app',
      theme: AppTheme.theme(),
      home: const HomePage(),
    );
  }
}
