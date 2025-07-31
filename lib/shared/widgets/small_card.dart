import 'package:flutter/material.dart';

class SmallCard extends StatelessWidget {
  final Color color;
  final Widget child;

  const SmallCard({
    super.key, 
    required this.color, 
    required this.child,
  });
  
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 180,
        height: 180,
        decoration: BoxDecoration( 
          borderRadius: BorderRadius.all( Radius.circular(20) ),
          color: color,
         ),
        child: child
      );
  }
}