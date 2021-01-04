import 'package:flutter/material.dart';
import 'package:igpazar/widgets/navigation_bar/navigation_bar_mobile.dart';
import 'package:igpazar/widgets/navigation_bar/navigation_bar_web.dart';
import 'package:responsive_builder/responsive_builder.dart';

class NavigationBar extends StatelessWidget {
  const NavigationBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: NavigationBarMobile(),
      desktop: NavigationBarWeb(),
    );
  }
}
