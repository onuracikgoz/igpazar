import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavbarLogo extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: SvgPicture.asset('assets/icons/shopping-cart.svg',height: 40,width: 40,),
    );
  }
}
