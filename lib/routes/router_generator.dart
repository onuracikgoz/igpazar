import 'package:flutter/material.dart';
import 'package:igpazar/views/home/homepage.dart';

import '../const.dart';

class RouteGenerator {


 static Route<dynamic> generateRoute(RouteSettings settings) {

   
    switch (settings.name) {
      case routeHome:
        return MaterialPageRoute(builder: (_) => HomePage());
        break;
      case routeAbout:
        return MaterialPageRoute(builder: (_) => HomePage());
        break;
      case routeContacts:
        return MaterialPageRoute(builder: (_) => HomePage());
        break;
    }
  }

}