import 'package:flutter/material.dart';
import 'package:imc_app/core/theme/app_theme.dart';
import 'package:imc_app/presentation/home/components/calculate_btn.dart';
import 'package:imc_app/presentation/home/components/gender_selector.dart';
import 'package:imc_app/presentation/home/components/height_card.dart';
import 'package:imc_app/presentation/home/components/physical_activity_card.dart';
import 'package:imc_app/presentation/home/components/weight_age_cards.dart';

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
   
      body: Padding(
        padding: const EdgeInsets.symmetric( vertical: 16, horizontal: 16 ),
        child: const Center(
          child: Column(
            children: [
              GenderSelector(),
              SizedBox( height: 20 ),
              HeightCard(lable: "Altura"),
              WeightAgeCards(),
              PhysicalActivityCard(),
              Spacer(),
              CalculateBtn(),
            ],
          )
        ),
      ),
    );
  }
}