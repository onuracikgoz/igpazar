import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:igpazar/widgets/navigation_bar/navbar_item.dart';
import 'package:igpazar/widgets/navigation_bar/navbar_logo.dart';

class NavigationBarWeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      margin: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 7,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  NavbarLogo(),
                  Text(
                    "İGPAZAR",
                    style: TextStyle(color: Colors.black, fontSize: 40.0),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                NavbarItem(
                  text: "Anasayfa",
                ),
                SizedBox(width: 30.0),
                NavbarItem(
                  text: "İletişim",
                ),
                SizedBox(width: 30.0),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
