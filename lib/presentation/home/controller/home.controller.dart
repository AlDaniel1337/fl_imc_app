import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imc_app/core/theme/app_theme.dart';

/// HomeController _HomeController = Get.put(HomeController());

class HomeController extends GetxController{
  
  RxBool isMaleGenderSelected = false.obs;
  RxBool isFemaleGenderSelected = false.obs;

  selectMaleGender(){
    isMaleGenderSelected.value = true;
    isFemaleGenderSelected.value = false;
  }

  selectFemaleGender(){
    isFemaleGenderSelected.value = true;
    isMaleGenderSelected.value = false;
  }

  Color getCardColor({ required bool isSelected }){
    return isSelected 
      ? AppTheme.backgroundComponent 
      : AppTheme.backgroundComponentSelected;
  }

}