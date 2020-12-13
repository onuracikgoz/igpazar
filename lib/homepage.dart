import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:igpazar/const.dart';
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
        child: Column(
          children: [
            Container(
              height: 90,
              margin: EdgeInsets.all(40.0),
              decoration: BoxDecoration(
                color: Color(0xFFF5F5DC),
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Image.asset('images/shopping-cart.png'),
                          ),
                          Text(
                            "İGPAZAR",
                            style:
                                TextStyle(color: Colors.black, fontSize: 40.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("Anasayfa", style: menuText),
                            Text("Erkek", style: menuText),
                            Text("Kadın", style: menuText),
                            Text("İletişim", style: menuText)
                          ]),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 200.0,
            ),
            Container(height:303.0,child: buildFutureBuilder(_jsonService))
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
                  return Container(
                    margin: EdgeInsets.all(10.0),
                    width: 250.0,
                    height: 400.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          _shop[index].shopName,
                          style: TextStyle(fontSize: 25.0),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  _shop[index].shopImage,
                                  fit: BoxFit.contain,
                                ),
                              )),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.all(0.0),
                        //   child: Text(
                        //     _shop[index].shopBiography,
                        //     style: TextStyle(fontSize: 17.0),
                        //     textAlign: TextAlign.center,
                        //   ),
                        // )
                      ],
                    ),
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

  final Shader linearGradient = LinearGradient(
    colors: <Color>[Color(0xffDA44bb), Color(0xff8921aa)],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
}
