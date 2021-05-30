import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:igpazar/const.dart';
import 'package:igpazar/models/shops.dart';
import 'package:igpazar/store/mode_store.dart';
import 'package:igpazar/store/services.dart';
import 'package:igpazar/widgets/navigation_bar/navigation_bar_mobile.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      ModeStore _modeStore = Provider.of<ModeStore>(context, listen: false);
      _modeStore.changeDarkModeLaunch(context);

      Provider.of<ServicesFromNetworkStore>(context, listen: false)
          .getShops(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    ModeStore _modeStore = Provider.of<ModeStore>(context, listen: false);
    ServicesFromNetworkStore _serviceStore =
        Provider.of<ServicesFromNetworkStore>(context, listen: false);
    return Observer(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: NavigationBarMobile(),
          backgroundColor: color(context),
        ),
        body: Observer(builder: (_) {
          return Container(
            color: color(context),
            child: ListView.separated(
                physics: ScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                itemCount: _serviceStore.discoveryList.length,
                separatorBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 10,
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 1), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(0),
                      color: color(context),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, '/shopPage', arguments: {
                                'shopId': _serviceStore.discoveryList[index].id
                              });
                            },
                            child: Row(
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
                                      color: _modeStore.darkMode
                                          ? Color(0xFFFFFFFF)
                                          : Color(0xFF212121),
                                      fontSize: 20,
                                      fontFamily: "Roboto",
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Container(
                              height: 350,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    spreadRadius: 2,
                                    blurRadius: 2,
                                    offset: Offset(
                                        0, 1), // changes position of shadow
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(0),
                               color: color(context)
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(0),
                                child: Image(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(_serviceStore
                                      .discoveryList[index].shopImagesLarge),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              SvgPicture.asset(
                                "assets/icons/like.svg",
                                height: 25,
                                width: 25,
                                color: _modeStore.darkMode
                                    ? Color(0xFFFFFFFF)
                                    : Color(0xFF212121),
                              ),
                              SizedBox(width: 10),

                              SvgPicture.asset(
                                "assets/icons/instagram.svg",
                                width: 25,
                                height: 25,
                                color: color(context,
                                    darkModeColor: white,
                                    unDarkModeColor: black),
                              ),
                              SizedBox(width: 10),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 3.0),
                                child: SvgPicture.asset(
                                  "assets/icons/send.svg",
                                  height: 25,
                                  width: 25,
                                  color: color(context,
                                      darkModeColor: white,
                                      unDarkModeColor: black),
                                ),
                              ),

                              // Expanded(
                              //   child: Container(
                              //     margin: EdgeInsets.symmetric(vertical: 10),
                              //     child: Material(
                              //       color: Colors.white,
                              //       elevation: 3,
                              //       borderRadius: BorderRadius.circular(6),
                              //       child: InkWell(
                              //         customBorder: RoundedRectangleBorder(
                              //           borderRadius: BorderRadius.circular(6),
                              //         ),
                              //         onTap: () {},
                              //         child: Padding(
                              //           padding: const EdgeInsets.all(5.0),
                              //           child: Row(
                              //             mainAxisAlignment:
                              //                 MainAxisAlignment.center,
                              //             children: [
                              //               SvgPicture.asset(
                              //                 "assets/icons/clothes_icon.svg",
                              //                 width: 25,
                              //                 height: 25,
                              //               ),
                              //               SizedBox(
                              //                 width: 5,
                              //               ),
                              //               Container(
                              //                   child: Text(
                              //                 "Diğer Ürünleri gör",
                              //                 style: TextStyle(
                              //                     color: Colors.black),
                              //               )),
                              //             ],
                              //           ),
                              //         ),
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              // SizedBox(width: 10),
                              // Expanded(
                              //   child: Container(
                              //     margin: EdgeInsets.symmetric(vertical: 10),
                              //     child: Material(
                              //       color: Colors.white,
                              //       elevation: 3,
                              //       borderRadius: BorderRadius.circular(6),
                              //       child: InkWell(
                              //         customBorder: RoundedRectangleBorder(
                              //           borderRadius: BorderRadius.circular(6),
                              //         ),
                              //         onTap: () {},
                              //         child: Padding(
                              //           padding: const EdgeInsets.all(5.0),
                              //           child: Row(
                              //             mainAxisAlignment:
                              //                 MainAxisAlignment.center,
                              //             children: [
                              //               SvgPicture.asset(
                              //                 "assets/icons/instagram_icon.svg",
                              //                 width: 25,
                              //                 height: 25,
                              //               ),
                              //               SizedBox(
                              //                 width: 5,
                              //               ),
                              //               Container(
                              //                   child: Text(
                              //                 "Sayfayı ziyaret et",
                              //                 style: TextStyle(
                              //                     color: Colors.black),
                              //               )),
                              //             ],
                              //           ),
                              //         ),
                              //       ),
                              //     ),
                              //   ),
                              // ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }),
          );
        }),
      ),
    );
  }
}
