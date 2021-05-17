import 'package:flutter/material.dart';
import 'package:igpazar/widgets/navigation_bar/navbar_logo.dart';

class NavigationBarMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              NavbarLogo(),
              Text(
                "İGPAZAR",
                style: TextStyle(
                    fontSize: 30, fontFamily: "bebas", color: Colors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
