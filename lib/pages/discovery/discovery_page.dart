import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:igpazar/models/shops.dart';
import 'package:igpazar/store/services.dart';
import 'package:igpazar/widgets/navigation_bar/navigation_bar_mobile.dart';
import 'package:provider/provider.dart';
import 'package:igpazar/extensions.dart';

class DiscoveryPage extends StatefulWidget {
  @override
  _DiscoveryPageState createState() => _DiscoveryPageState();
}

class _DiscoveryPageState extends State<DiscoveryPage> {
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
    return Scaffold(
      appBar: AppBar(
        title: NavigationBarMobile(),
        backgroundColor: Colors.white,
      ),
      body: Observer(builder: (_) {
        return Container(
          child: ListView.separated(
              physics: ScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              itemCount: _serviceStore.discoveryList.length,
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
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                  child: ClipOval(
                                child: Image(
                                  height: 50,
                                  width: 50,
                                  image: NetworkImage(_serviceStore
                                      .discoveryList[index].shopImage),
                                ),
                              )),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  _serviceStore.discoveryList[index].shopName,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: "Roboto",
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 400,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(
                                      0, 1), // changes position of shadow
                                ),
                              ],
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image(
                                fit: BoxFit.fill,
                                image: NetworkImage(_serviceStore
                                    .discoveryList[index].shopImagesLarge),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
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
                                          mainAxisAlignment: MainAxisAlignment.center,
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
                                              "Diğer Ürünleri gör",
                                              style: TextStyle(
                                                  color: Colors.black),
                                            )),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width:10),
                              Expanded(
                                child: Container(
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
                                           mainAxisAlignment: MainAxisAlignment.center,
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
                                              "Sayfayı ziyaret et",
                                              style: TextStyle(
                                                  color: Colors.black),
                                            )),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
        );
      }),
    );
  }
}
