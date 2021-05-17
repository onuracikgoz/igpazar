import 'package:flutter/material.dart';
import 'package:igpazar/pages/discovery/discovery_page.dart';
import 'package:igpazar/store/services.dart';
import 'package:igpazar/pages/home/home_view.dart';
import 'package:igpazar/pages/test/ig_auth.dart';
import 'package:provider/provider.dart';

void main() {
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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: "Bebas",
          textTheme: TextTheme(),
          primarySwatch: Colors.blue,
        ),
        home: DiscoveryPage(),
      ),
    );
  }
}
