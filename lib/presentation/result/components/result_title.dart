import 'package:flutter/material.dart';

class ResultTitle extends StatelessWidget {
   
  const ResultTitle({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Text( "Tu resultado",
      style: TextStyle(
        fontSize: 38,
        color: Colors.white,
        fontWeight: FontWeight.bold
      ),
    );
  }
}