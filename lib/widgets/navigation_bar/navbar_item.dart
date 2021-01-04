import 'package:flutter/material.dart';
import 'package:igpazar/const.dart';

class NavbarItem extends StatelessWidget {
  final String text;

  NavbarItem({this.text});
  @override
  Widget build(BuildContext context) {
    return Text(text, style: menuText);
  }
}
