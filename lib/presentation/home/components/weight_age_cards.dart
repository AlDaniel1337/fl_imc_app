import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imc_app/core/theme/app_theme.dart';
import 'package:imc_app/shared/controllers/imc.controller.dart';
import 'package:imc_app/shared/widgets/circular_button.dart';
import 'package:imc_app/shared/widgets/small_card.dart';

class WeightAgeCards extends StatelessWidget {
   
  const WeightAgeCards({ super.key });
  
  @override
  Widget build(BuildContext context) {
    
    final ImcController imcController = Get.put(ImcController());

    return Padding(
      padding: const EdgeInsets.symmetric( vertical: 16 ),
      child: Obx( (){

        final weight = imcController.weight;
        final age = imcController.age;

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
        
            SmallCard(
              color: AppTheme.backgroundComponent, 
              child: _InfoCard(
                label: "Peso", 
                data: "$weight",
                textEditingController: imcController.weightController,
                onTapAdd: () => imcController.changeWeight( weight.value + 1),
                onTapRemove: () => imcController.changeWeight( weight.value - 1),
                onManualChanged: ( newWeight ) => imcController.manualChangeWeight( newWeight ),
              )
            ),
            
            SmallCard(
              color: AppTheme.backgroundComponent, 
              child: _InfoCard(
                label: "Edad", 
                data: "$age",
                textEditingController: imcController.ageController,
                onTapAdd: () => imcController.changeAge( age.value + 1),
                onTapRemove: () => imcController.changeAge( age.value - 1),
                onManualChanged: ( newAge ) => imcController.manualChangeAge( newAge ),
              )
            ),
        
          ],
        );
      })
    );
  }
}

class _InfoCard extends StatelessWidget {

  final String label;
  final String data;
  final Function()? onTapAdd;
  final Function()? onTapRemove;
  final Function(String)? onManualChanged;
  final TextEditingController? textEditingController;

  const _InfoCard({ 
    required this.label, 
    required this.data, 
    this.onTapAdd, 
    this.onTapRemove, 
    this.onManualChanged, 
    this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {

    

    return Column(
      children: [
        
        Text(label.toUpperCase(), 
          style: TextStyle( 
            color: Colors.grey, 
            fontSize: 16, 
          )
        ),
        
        TextFormField(
          controller: textEditingController,
          decoration: InputDecoration(
            focusedBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
          ),
          textAlign: TextAlign.center,
          style: TextStyle( 
            color: Colors.white, 
            fontSize: 48, 
            fontWeight: FontWeight.bold 
          ),
          onChanged: onManualChanged,
        ),
    
        _Buttons(onTapAdd: onTapAdd, onTapRemove: onTapRemove)
        
      ],
    );
  }
}

class _Buttons extends StatelessWidget {

  final Function()? onTapAdd;
  final Function()? onTapRemove;

  const _Buttons({
    required this.onTapAdd,
    required this.onTapRemove,
  });


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomCircularButton(
          onTap: onTapRemove,
          child: Icon( Icons.remove, size: 36, color: Colors.white, ),
        ),
        
        SizedBox( width: 14 ),
        
        CustomCircularButton(
          onTap: onTapAdd,
          child: Icon( Icons.add, size: 36, color: Colors.white, ),
        ),
      ],
    );
  }
}