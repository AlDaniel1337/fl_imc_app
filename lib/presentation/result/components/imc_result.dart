import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imc_app/core/theme/app_theme.dart';
import 'package:imc_app/domain/entities/calorias.entity.dart';
import 'package:imc_app/shared/controllers/imc.controller.dart';

class ImcResult extends StatelessWidget {
   
  const ImcResult({super.key});
  
  @override
  Widget build(BuildContext context) {

    
    ImcController imcController = Get.put(ImcController());
    final imc = imcController.imc;
    final imcData = imcController.getColorByIMC();
    final caloriesDetails = imcController.calories;

    return Padding(
      padding: const EdgeInsets.symmetric( vertical: 32, horizontal: 16 ),
      child: Container(

        width: double.infinity,
        decoration: BoxDecoration(
          color: AppTheme.backgroundComponent,
          borderRadius: BorderRadius.circular( 16 ),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            
            Text(imcData.title, 
              style: TextStyle( color: Colors.white, fontSize: 30, fontWeight: FontWeight.w600 ) 
            ),

            _ImcNumberResult( imc: imc, color: imcData.color, ),

            Text(imcData.description, 
              style: TextStyle( color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400 ),
              textAlign: TextAlign.center, 
            ),

            _CaloriesGeneralDetails(caloriesDetails: caloriesDetails)
            
          ],
        ),
      ),
    );
  }
}

class _CaloriesGeneralDetails extends StatelessWidget {
  const _CaloriesGeneralDetails({
    required this.caloriesDetails,
  });

  final Calories caloriesDetails;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Consumo de calorías", 
          style: TextStyle( color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600 ) 
        ),
    
        _CaloriesTxtDetails(
          label: "Basal: ${caloriesDetails.basalCalories.toStringAsFixed(2)}"
        ),
    
        _CaloriesTxtDetails(
          label: "Consumo diario: ${caloriesDetails.dailyCalories.toStringAsFixed(2)}"
        ),
    
        _CaloriesTxtDetails(
          label: "Ganar peso: ${caloriesDetails.gainWeight.toStringAsFixed(2)}"
        ),
        
        _CaloriesTxtDetails(
          label: "Perder peso: ${caloriesDetails.loseWeight.toStringAsFixed(2)}"
        ),
      ],
    );
  }
}

class _CaloriesTxtDetails extends StatelessWidget {
  const _CaloriesTxtDetails({
    required this.label
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(label, 
      style: TextStyle( color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400 ),
      textAlign: TextAlign.center, 
    );
  }
}

class _ImcNumberResult extends StatelessWidget {

  final double imc;
  final Color color;

  const _ImcNumberResult({
    required this.imc,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {


    return Text("IMC: ${imc.toStringAsFixed(2)}",
      style: TextStyle( 
        color: color, 
        fontSize: 56, 
        fontWeight: FontWeight.bold 
      ),
    );
  }
}