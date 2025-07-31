import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imc_app/presentation/home/components/gender_card.dart';
import 'package:imc_app/shared/controllers/imc.controller.dart';



class GenderSelector extends StatelessWidget {
   
  const GenderSelector({super.key});
  
  @override
  Widget build(BuildContext context) {

    final ImcController imcController = Get.put(ImcController());

    return Obx(() {

      final isMale = imcController.isMaleGenderSelected.value;
      final isFemale = imcController.isFemaleGenderSelected.value;

      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          
          GenderCard(
            lable: "Hombre", 
            icon: Icons.male_rounded,
            onPress: imcController.selectMaleGender,
            color: imcController.getCardColor(isSelected: isMale),
          ),

          GenderCard(
            lable: "Mujer", 
            icon: Icons.female_rounded,
            onPress: imcController.selectFemaleGender,
            color: imcController.getCardColor(isSelected: isFemale),
          ),

        ],
      );
    });
  }
}