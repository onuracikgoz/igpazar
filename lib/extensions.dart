
import 'package:flutter/material.dart';
import 'package:igpazar/const.dart';

extension BuildContextExtensions on BuildContext {




  double width() {
    return MediaQuery.of(this).size.width;
  }

  double height() {
    return MediaQuery.of(this).size.height;
  }}


extension StringExtensions on String {
  Flexible toCircleImage({width, height}) {
    return Flexible(
      child: Container(
        width: width,
        height: height,
        decoration: new BoxDecoration(
          shape: BoxShape.circle,
          color: white,
          image: new DecorationImage(
            image: new NetworkImage(
              this,
            ),
            fit: BoxFit.cover,
          ),
         
        ),
      ),
    );
  } }
