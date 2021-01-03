import 'package:flutter/material.dart';
import 'package:igpazar/navigationbar.dart';
import 'package:igpazar/widgets/grid_view_builder.dart';
import 'package:responsive_builder/responsive_builder.dart';


class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder (
      builder: (context, sizingInformation)=>Scaffold(
        drawer: sizingInformation.deviceScreenType==DeviceScreenType.mobile? null : null,

        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              children: [
                NavigationBarWeb(),
                SizedBox(
                  height: 70.0,
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: GridViewBuilder()),
              ],
            ),
          ),
        ),


       
  



      )
      
      
    );
  }
}