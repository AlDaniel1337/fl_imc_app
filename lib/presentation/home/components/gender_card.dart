import 'package:flutter/material.dart';
import 'package:imc_app/shared/widgets/small_card.dart';

class GenderCard extends StatelessWidget {

  final String lable;
  final IconData icon;
  final VoidCallback? onPress;
  final Color color;
   
  const GenderCard({
    super.key, 
    required this.lable, 
    required this.icon, 
    required this.color,
    required this.onPress, 
  });
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: SmallCard(
        color: color, 
        child: Column(
          children: [
            Icon( icon, size: 140, color: Colors.white, ),
            Text(lable.toUpperCase(), style: TextStyle( color: Colors.white, fontSize: 18 ),)
          ],
        )
      )
    );
  }
}