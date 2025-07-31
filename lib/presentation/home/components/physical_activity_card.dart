import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imc_app/core/theme/app_theme.dart';
import 'package:imc_app/shared/controllers/imc.controller.dart';

class PhysicalActivityCard extends StatelessWidget {
   
  const PhysicalActivityCard({
    super.key, 
  });
  
  @override
  Widget build(BuildContext context) {

    final diviceSize  = MediaQuery.of(context).size;
    final ImcController imcController = Get.put(ImcController());

    return Container(
      height: 160,
      width: diviceSize.width,
      decoration: BoxDecoration( 
        borderRadius: BorderRadius.all( Radius.circular(20) ),
        color: AppTheme.backgroundComponent,
       ),
      child: Obx( () {
        
        final selectedPhysicalActivity = imcController.selectedPhysicalActivity.value;

        return Column(
          children: [
            Text( "Actividad física".toUpperCase() , style: TextStyle( color: Colors.white, fontSize: 18 ),),

            SizedBox( height: 24),
            Text( selectedPhysicalActivity.description, 
              style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
            ),

            Slider(
              value: imcController.physicalActivity.value, 
              min: 0,
              max: 4,
              divisions: 4,
              label: selectedPhysicalActivity.label,
              onChanged: (newValue) => imcController.changePhysicalActivity(newValue),
            )
          ],
        );
      }),
    );
  }
}