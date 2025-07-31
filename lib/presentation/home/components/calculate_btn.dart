import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imc_app/shared/controllers/imc.controller.dart';
import 'package:imc_app/shared/widgets/custom_material_btn.dart';

class CalculateBtn extends StatelessWidget {

  final Color? color;
   
  const CalculateBtn({
    this.color, 
    super.key, 
  });
  
  @override
  Widget build(BuildContext context) {

    ImcController imcController = Get.put(ImcController());

    return CustomMaterialBtn(
      label: "Calcular",
      onTap: imcController.calculateImc,
    );
  }
}