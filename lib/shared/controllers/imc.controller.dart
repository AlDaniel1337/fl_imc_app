import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:imc_app/core/navigation/navigation.dart';
import 'package:imc_app/core/theme/app_theme.dart';
import 'package:imc_app/domain/entities/calorias.entity.dart';
import 'package:imc_app/domain/entities/imc_result.entity.dart';
import 'package:imc_app/domain/enums/physical_activity.enum.dart';

/// ImcController _imcController = Get.put(ImcController());
/// ImcController imcController = Get.put(ImcController());

class ImcController extends GetxController{
  
  //[ Genero ]
  final RxBool _isMaleGenderSelected = false.obs;
  RxBool get isMaleGenderSelected => _isMaleGenderSelected;

  final RxBool _isFemaleGenderSelected = false.obs;
  RxBool get isFemaleGenderSelected => _isFemaleGenderSelected;

  selectMaleGender(){
    _isMaleGenderSelected.value = true;
    _isFemaleGenderSelected.value = false;
  }

  selectFemaleGender(){
    _isFemaleGenderSelected.value = true;
    _isMaleGenderSelected.value = false;
  }


  //[ Altura ]
  final RxDouble _heigh = 170.0.obs;
  RxDouble get heigh => _heigh;
  changeHeigh( double newHeigh ) => _heigh.value = newHeigh;
  

  //[ Peso ]
  final RxInt _weight = 80.obs;
  RxInt get weight => _weight;
  final weightController = TextEditingController(text: "80");
  changeWeight( int newWeight ) {
    if(newWeight < 0) return;
    _weight.value = newWeight;
    weightController.text = _weight.value.toString();
  }
  manualChangeWeight( String newWeight ) => _weight.value = int.tryParse( weightController.text ) ?? 0;


  //[ Edad ]
  final RxInt _age = 30.obs;
  RxInt get age => _age;
  final ageController = TextEditingController(text: "30");
  changeAge( int newAge ) {
    if(newAge < 0) return;
    _age.value = newAge;
    ageController.text = _age.value.toString();
  }
  manualChangeAge( String newAge ) => _age.value = int.tryParse( ageController.text ) ?? 0;


  //[ IMC ]
  double _imc = 0.0;
  double get imc => _imc;
  calculateImc(){
    if( checkIfThereIsMissingInfo() ) return;

    double fixedHeigh = heigh.value / 100;
    _imc = weight.value / ( fixedHeigh * fixedHeigh );
    calculateCalories();
    
    Navigation.goToPage(page: Navigation.result);
  }


  bool checkIfThereIsMissingInfo(){
    if( !isFemaleGenderSelected.value && !isMaleGenderSelected.value ){
      Get.snackbar(
        "Información faltante", 
        "Selecciona el género para continuar",
        colorText: Colors.white,
        backgroundColor: AppTheme.backgroundComponent
      );
      return true;
    }
    return false;
  }
  

  //[ Calorias ]
  Calories calories = Calories(
    basalCalories: 0, 
    dailyCalories: 0, 
    gainWeight: 0, 
    loseWeight: 0,
  );
  calculateCalories(){
    
    if(isFemaleGenderSelected.value){
      calories.basalCalories = 65 + ( 9.6 * weight.value ) + ( 1.8 * heigh.value ) - (4.7 * age.value);
    }
    if( isMaleGenderSelected.value ){
      calories.basalCalories = 66 + ( 13.7 * weight.value ) + ( 5 * heigh.value ) - (6.8 * age.value);
    }

    calories.dailyCalories = calories.basalCalories * _selectedPhysicalActivity.value.multiplier;
    calories.gainWeight = calories.dailyCalories + 500;
    calories.loseWeight = calories.dailyCalories - 500;

  }
 

  final _imcResults = [
      ImcResult(color: Colors.blue, title: "Bajo", description: "Tu peso esta por debajo de lo recomendado."),
      ImcResult(color: Colors.green, title: "Normal", description: "Tu peso esta en un rango saludable."),
      ImcResult(color: Colors.orange, title: "Sobrepeso", description: "Tienes sobrepeso, cuida tu alimentación."),
      ImcResult(color: Colors.red, title: "Obesidad", description: "Tu peso esta muy por encima de lo saludable."),
    ];
  ImcResult getColorByIMC(){
    return switch( imc ){
      < 18.5  => _imcResults[0],
      < 24.9  => _imcResults[1],
      < 29.99 => _imcResults[2],
      _       => _imcResults[3],
    };
  }


  
  //[ Actividad física ]
  final RxDouble _physicalActivity = 0.0.obs;
  RxDouble get physicalActivity => _physicalActivity;
  final _selectedPhysicalActivity = PhysicalActivityEnum.little.obs;
  Rx<PhysicalActivityEnum> get selectedPhysicalActivity => _selectedPhysicalActivity;

  changePhysicalActivity( double newPhysicalActivity ) {

    _physicalActivity.value = newPhysicalActivity;

    _selectedPhysicalActivity.value = switch( newPhysicalActivity.toInt() ){
      0 => PhysicalActivityEnum.little,
      1 => PhysicalActivityEnum.light,
      2 => PhysicalActivityEnum.moderate,
      3 => PhysicalActivityEnum.strong,
      4 => PhysicalActivityEnum.veryStrong,
      _ => PhysicalActivityEnum.little,
    };

  }
  

  
  Color getCardColor({ required bool isSelected }){
    return isSelected 
      ? AppTheme.backgroundComponentSelected 
      : AppTheme.backgroundComponent;
  }
}