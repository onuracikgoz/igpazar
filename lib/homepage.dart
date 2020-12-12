import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:igpazar/models/shops.dart';
import 'package:igpazar/services/html_services.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    JsonParser _jsonService = new JsonParser();
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: Center(child: Text("İNSTAGRAM PAZAR",style: TextStyle(color: Colors.white,fontSize: 50.0),)),
              width: MediaQuery.of(context).size.width,
          height: 100.0,
              color: Colors.blueAccent,
            ),
            Expanded(child: buildFutureBuilder(_jsonService)),
          ],
        ),
      ),
    );
  }

  FutureBuilder<List<Shop>> buildFutureBuilder(JsonParser _jsonService) {
    return FutureBuilder<List<Shop>>(
      future: _jsonService.getShops(),
      builder: (BuildContext context, AsyncSnapshot<List<Shop>> snapshot) {
        List<Shop> _shop = snapshot.data;
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            return ListView.builder(
              scrollDirection: Axis.horizontal,
                itemCount: _shop.length,
                itemBuilder: (BuildContext context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(children: [
                        Text(_shop[index].shopName),
                        Image.network(_shop[index].shopImage),
                        Text(_shop[index].shopBiography)


                        
                        

                    ],),
                  );
                });

          case ConnectionState.none:
            return (Text(
                "Ekran yüklenirken bir hata oluştu bir daha deneyiniz."));
          case ConnectionState.waiting:
            return LinearProgressIndicator();

          case ConnectionState.active:
            return Container();
          default:
            return Container();
        }
      },
    );
  }
}
