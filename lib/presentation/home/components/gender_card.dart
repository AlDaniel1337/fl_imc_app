import 'package:flutter/material.dart';

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
      child: Container(
        width: 180,
        height: 180,
        decoration: BoxDecoration( 
          borderRadius: BorderRadius.all( Radius.circular(20) ),
          color: color,
         ),
        child: Column(
          children: [
            Icon( icon, size: 140, color: Colors.white, ),
            Text(lable.toUpperCase(), style: TextStyle( color: Colors.white, fontSize: 18 ),)
          ],
        ),
      ),
    );
  }
}