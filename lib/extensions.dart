
import 'package:flutter/material.dart';

extension BuildContextExtensions on BuildContext {
  double width() {
    return MediaQuery.of(this).size.width;
  }

  double height() {
    return MediaQuery.of(this).size.height;
  }}