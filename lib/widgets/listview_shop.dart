import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:igpazar/models/shops.dart';
import 'package:igpazar/store/services.dart';
import 'package:provider/provider.dart';
import 'package:igpazar/extensions.dart';

class ListViewShop extends StatefulWidget {
  @override
  _ListViewShopState createState() => _ListViewShopState();
}

class _ListViewShopState extends State<ListViewShop> {
  List<Shop> shopList = [];

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      Provider.of<ServicesFromNetworkStore>(context, listen: false)
          .getShops(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    ServicesFromNetworkStore _serviceStore =
        Provider.of<ServicesFromNetworkStore>(context, listen: false);
    return Observer(builder: (_) {
      return Container(
        child: ListView.separated(
            physics: ScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            itemCount: _serviceStore.shopList.length,
            separatorBuilder: (BuildContext context, int index) {
              return Container(
                height: 10,
              );
            },
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 1), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            _serviceStore.shopList[index].shopName,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20,fontFamily: "bebas",),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(6),
                                color: Colors.white,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(6),
                                child: Image.network(
                                  _serviceStore.shopList[index].shopImage,
                                  height: 100,
                                  width: 100,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    "Takipçi Sayısı :" +
                                        _serviceStore.shopList[index].follower
                                            .toString(),
                                    textAlign: TextAlign.start,
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    "Takipçi Sayısı :" +
                                        _serviceStore.shopList[index].follower
                                            .toString(),
                                    textAlign: TextAlign.start,
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 10),
                                child: Material(
                                  color: Colors.white,
                                  elevation: 3,
                                  borderRadius: BorderRadius.circular(6),
                                  child: InkWell(
                                    customBorder: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    onTap: () {},
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                            "images/instagram_icon.svg",
                                            width: 25,
                                            height: 25,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Container(
                                              child: Text(
                                            "Sayfaya git",
                                            style: TextStyle(color: Colors.black),
                                          )),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 10),
                                child: Material(
                                  color: Colors.white,
                                  elevation: 3,
                                  borderRadius: BorderRadius.circular(6),
                                  child: InkWell(
                                    customBorder: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    onTap: () {},
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                            "images/clothes_icon.svg",
                                            width: 25,
                                            height: 25,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Container(
                                              child: Text(
                                            "Ürünleri Gör",
                                            style: TextStyle(color: Colors.black),
                                          )),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ])
                      ],
                    ),
                  ),
                ),
              );
            }),
      );
    });
  }
}
