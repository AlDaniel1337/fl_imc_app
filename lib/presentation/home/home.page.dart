import 'package:flutter/material.dart';
import 'package:imc_app/core/theme/app_theme.dart';

class HomePage extends StatelessWidget {

  static const String route = "/";
   
  const HomePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: AppTheme.background,
   
      appBar: AppBar(
        title: const Text('IMC calculator'),
        backgroundColor: AppTheme.primary,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
   
      body: const Center(
         child: Text('HomePage'),
      ),
    );
  }
}