import 'package:flutter/material.dart';

class NavbarLogo extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Image.asset('images/shopping-cart.png',height: 40,width: 40,),
    );
  }
}
