import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imc_app/core/theme/app_theme.dart';
import 'package:imc_app/shared/controllers/imc.controller.dart';

class HeightCard extends StatelessWidget {

  final String lable;
   
  const HeightCard({
    super.key, 
    required this.lable, 
  });
  
  @override
  Widget build(BuildContext context) {

    final diviceSize  = MediaQuery.of(context).size;
    final ImcController imcController = Get.put(ImcController());

    return Container(
      height: 140,
      width: diviceSize.width,
      decoration: BoxDecoration( 
        borderRadius: BorderRadius.all( Radius.circular(20) ),
        color: AppTheme.backgroundComponent,
       ),
      child: Obx( () {
        
        final selectedHeigh = imcController.heigh.value;

        return Column(
          children: [
            Text( lable.toUpperCase() , style: TextStyle( color: Colors.white, fontSize: 18 ),),

            Text( "${ selectedHeigh.toStringAsFixed(0) } cm", 
              style: TextStyle(
                color: Colors.white, fontSize: 38, fontWeight: FontWeight.bold
              ), 
            ),

            Slider(
              value: selectedHeigh, 
              min: 0,
              max: 250,
              divisions: 250,
              label: selectedHeigh.toStringAsFixed(0),
              onChanged: (newValue) => imcController.changeHeigh( newValue ),
            )
          ],
        );
      }),
    );
  }
}