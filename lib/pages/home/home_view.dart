import 'package:flutter/material.dart';
import 'package:igpazar/widgets/navigation_bar/navigation_bar.dart';
import 'package:igpazar/widgets/listview_shop.dart';
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
            body: SafeArea(
                          child: Scaffold(
                  resizeToAvoidBottomInset: false,
                
                  body: Container(
                    decoration: BoxDecoration(
                       gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xFF353A5F),
                Color(0xFF9EBAF3),
              ],),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          NavigationBar(),
                          SizedBox(
                            height: 20.0,
                          ),
                          Expanded(child: ListViewShop()),
                        ],
                      ),
                    ),
                  )),
            )));
  }
}
