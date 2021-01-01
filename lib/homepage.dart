import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:igpazar/const.dart';
import 'package:igpazar/models/shops.dart';
import 'package:igpazar/navigationbar.dart';
import 'package:igpazar/services/html_services3.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    JsonParser _jsonService = new JsonParser();
    return Scaffold(
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
                NavigationBarWeb(),
                SizedBox(
                  height: 70.0,
                ),

                Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: buildFutureBuilder(_jsonService)),
                // Container(
                //   width: 500.0,
                //   height: 700.0,
                //   child: ListView(
                //     children: [
                //       homeButton("Giyim"),
                //       homeButton("Kozmetik"),
                //       homeButton("Ayakkabı"),
                //       homeButton("Ayakkabı"),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ]),
    );
  }

  Padding homeButton(String text) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: FlatButton(
        onPressed: () {},
        child: Container(
          child: Center(
              child: Text(
            text,
            style: homePageText,
          )),
          height: 180.0,
          width: 500.0,
          decoration: BoxDecoration(
            color: Color(0xFFF5F5DC),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
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
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 300,
                    childAspectRatio: 1,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemCount: _shop.length,
                itemBuilder: (BuildContext context, index) {
                  return InkWell(
                    onTap: () {},
                    child: Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      elevation: 5.0,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            // Text(
                            //   _shop[index].shopName,
                            //   textAlign: TextAlign.center,
                            //   style: TextStyle(
                            //       fontSize: 20.0, color: Colors.white),
                            // ),
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.network(
                                  _shop[index].shopImage,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Text(
                              _shop[index].shopName,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.black),
                            ),
                          ]),
                    ),
                  );
                });

          case ConnectionState.none:
            return (Text(
                "Ekran yüklenirken bir hata oluştu bir daha deneyiniz."));
          case ConnectionState.waiting:
            return Container(
                child: Center(
                    child: Text(
              "Butikler yükleniyor lütfen bekleyiniz...",
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            )));

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
