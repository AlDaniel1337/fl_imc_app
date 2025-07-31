import 'package:flutter/material.dart';
import 'package:imc_app/core/navigation/navigation.dart';
import 'package:imc_app/core/theme/app_theme.dart';
import 'package:imc_app/presentation/result/components/imc_result.dart';
import 'package:imc_app/presentation/result/components/result_title.dart';
import 'package:imc_app/shared/widgets/custom_material_btn.dart';

class ResultPage extends StatelessWidget {

  static const String route = "/result";
   
  const ResultPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: AppTheme.background,
   
      appBar: AppBar(
        title: const Text('Resultado'),
        backgroundColor: AppTheme.primary,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
   
      body: Padding(
        padding: const EdgeInsets.symmetric( vertical: 16, horizontal: 16 ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        
            ResultTitle(),

            Expanded(
              child: ImcResult()
            ),

            CustomMaterialBtn(
              label: "Finalizar",
              onTap: () => Navigation.goBack( context: context ),
            )

          ],
        ),
      )
    );
  }
}