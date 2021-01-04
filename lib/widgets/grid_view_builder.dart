import 'package:flutter/material.dart';
import 'package:igpazar/models/shops.dart';
import 'package:igpazar/services/html_services3.dart';
import 'package:responsive_builder/responsive_builder.dart';

class GridViewBuilder extends StatelessWidget {
  final JsonParser _jsonService = new JsonParser();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: FutureBuilder<List<Shop>>(
        future: _jsonService.getShops(),
        builder: (BuildContext context, AsyncSnapshot<List<Shop>> snapshot) {
          List<Shop> _shop = snapshot.data;
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return ResponsiveBuilder(
                builder: (context, sizingInformation) {
                  double titleSize = sizingInformation.deviceScreenType ==
                          DeviceScreenType.mobile
                      ? 15
                      : 20;

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
                            clipBehavior: Clip.antiAliasWithSaveLayer,
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
                                    child: Image.network(
                                      _shop[index].shopImage,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 12.0,right: 12.0),
                                    child: Text(
                                      _shop[index].shopName,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        
                                          fontSize: titleSize, color: Colors.black),
                                    ),
                                  ),
                                ]),
                          ),
                        );
                      });
                },
              );

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
      ),
    );
  }
}
