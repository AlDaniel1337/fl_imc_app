import 'package:flutter/material.dart';

class CustomCircularButton extends StatelessWidget {
   
  final double size;
  final double? radius;
  final Widget child;
  final Color? color;
  final Function()? onTap;
      
  const CustomCircularButton({
    required this.child, 
    this.size = 60, 
    this.radius, 
    this.color, 
    this.onTap,
    super.key, 
  });
  
  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;
    final BorderRadius borderRadius = BorderRadius.all( Radius.circular( radius ?? size / 2 ));

    return Container(
      
      // Decoracion principal
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        color: (onTap != null) ? (color ?? colors.primary) : Colors.grey,
      ),
    
      child: Material(
        borderRadius: borderRadius,
        color: (onTap != null) ? Colors.transparent : Colors.grey,

        //? Efecto al tocar
        child:  InkWell(
          onTap: onTap,
          borderRadius: borderRadius,
      
          child: Container(
            alignment: Alignment.center,
            width: size,
            height: size,
            decoration: BoxDecoration(
              borderRadius: borderRadius,
            ),

            child: child
      
          ),
        )
      ),
    
    );
  }
}