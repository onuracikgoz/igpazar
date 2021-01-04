import 'package:flutter/material.dart';
import 'package:igpazar/widgets/navigation_bar/navigation_bar.dart';
import 'package:igpazar/widgets/navigation_bar/navigation_bar_web.dart';
import 'package:igpazar/widgets/grid_view_builder.dart';
import 'package:igpazar/widgets/navigation_drawer/navigaton_drawer.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
        builder: (context, sizingInformation) => Scaffold(
            drawer:
                sizingInformation.deviceScreenType == DeviceScreenType.mobile
                    ? NavigationDrawer()
                    : null,
            body: Scaffold(
                resizeToAvoidBottomPadding: false,
                body: Stack(children: [
                  Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                      colors: [
                        Color(0xFFfeda75),
                        Color(0xFFfa7e1e),
                        Color(0xFFd62976),
                        Color(0xFF962fbf),
                        Color(0xFF4f5bd5)
                      ],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    )),
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Column(
                        children: [
                          NavigationBar(),
                          SizedBox(
                            height: 70.0,
                          ),
                          GridViewBuilder(),
                        ],
                      ),
                    ),
                  ),
                ]))));
  }
}
