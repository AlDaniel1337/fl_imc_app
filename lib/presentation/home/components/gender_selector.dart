import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imc_app/presentation/home/components/gender_card.dart';
import 'package:imc_app/presentation/home/controller/home.controller.dart';



class GenderSelector extends StatelessWidget {
   
  const GenderSelector({super.key});
  
  @override
  Widget build(BuildContext context) {

    final HomeController homeController = Get.put(HomeController());

    return Obx(() {

      final isMale = homeController.isMaleGenderSelected.value;
      final isFemale = homeController.isFemaleGenderSelected.value;

      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          
          GenderCard(
            lable: "Hombre", 
            icon: Icons.male_rounded,
            onPress: homeController.selectMaleGender,
            color: homeController.getCardColor(isSelected: isMale),
          ),

          GenderCard(
            lable: "Mujer", 
            icon: Icons.female_rounded,
            onPress: homeController.selectFemaleGender,
            color: homeController.getCardColor(isSelected: isFemale),
          ),

        ],
      );
    });
  }
}