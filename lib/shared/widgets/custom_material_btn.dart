import 'package:flutter/material.dart';

class CustomMaterialBtn extends StatelessWidget {

  final Color? color;
  final String label;
  final Function()? onTap;
   
  const CustomMaterialBtn({
    super.key, 
    this.color,
    this.onTap, 
    required this.label, 
  });
  
  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;
    final BorderRadius borderRadius = BorderRadius.all( Radius.circular( 15 ));
    final size = MediaQuery.of(context).size;

    return Container(

      // Decoracion principal
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        color: color ?? colors.primary
      ),
    
      child: Material(
        borderRadius: borderRadius,
        color:  Colors.transparent,

        //? Efecto al tocar
        child:  InkWell(
          onTap: onTap,
          borderRadius: borderRadius,
      
          child: Container(
            alignment: Alignment.center,
            height: 50,
            width: size.width,
            decoration: BoxDecoration(
              borderRadius: borderRadius,
            ),
          
            child: Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18
              ),
            ), 
                
          ),
        )
      ),
    
    );
  }
}