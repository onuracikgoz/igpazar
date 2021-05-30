import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:igpazar/const.dart';
import 'package:igpazar/pages/discovery/discovery_page.dart';
import 'package:igpazar/pages/shop/shop_page.dart';
import 'package:igpazar/store/mode_store.dart';
import 'package:igpazar/store/services.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ServicesFromNetworkStore>(
            create: (_) => ServicesFromNetworkStore()),
        Provider<ModeStore>(create: (_) => ModeStore()),
      ],
      child: Builder(builder: (BuildContext context) {
          ModeStore modeStore = Provider.of<ModeStore>(context, listen: false);
          return Observer(builder: (_) {
            return MaterialApp(
              darkTheme: ThemeData.dark(),
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
               
                textTheme: TextTheme(
                  bodyText2: TextStyle(
                      color: color(context,darkModeColor: white,unDarkModeColor: black), fontSize: 20),
                ),
                scaffoldBackgroundColor: color(context),
              ),
              routes: {
                '/shopPage': (context) => ShopPage(),
                '/discoveryPage': (context) => DiscoveryPage(),
              },
              initialRoute: '/discoveryPage',
            );
          });
        
      }),
    );
  }
}
