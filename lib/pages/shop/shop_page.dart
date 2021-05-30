import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:igpazar/const.dart';
import 'package:igpazar/store/services.dart';
import 'package:igpazar/widgets/navigation_bar/navigation_bar_mobile.dart';
import 'package:provider/provider.dart';
import 'package:igpazar/extensions.dart';

class ShopPage extends StatefulWidget {
  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  String shopId;

  @override
  void initState() {
    ServicesFromNetworkStore _service =
        Provider.of<ServicesFromNetworkStore>(context, listen: false);

    Future.delayed(Duration.zero, () {
      final arguments = ModalRoute.of(context).settings.arguments as Map;
      if (arguments != null) {
        shopId = arguments['shopId'];

        _service.getShopById(shopId);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ServicesFromNetworkStore _service =
        Provider.of<ServicesFromNetworkStore>(context, listen: false);

    return Observer(
      builder: (_) => Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: color(context, darkModeColor: white, unDarkModeColor: black),
          ),
          centerTitle: true,
          title: NavigationBarMobile(),
          backgroundColor: color(context),
          
        ),
   
        body: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Container(
            color: color(context),
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              if (_service.shop.shopImage != null)
                                _service.shop.shopImage
                                    .toCircleImage(height: 100.0, width: 100.0),
                              Column(
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        _service.shop.follower.toString(),
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      Text("Takipçi",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.grey)),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              _service.shop.shopName ?? "",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          SizedBox(
                            height: 0,
                          ),
                          Text(
                            _service.shop.shopBiography,
                            textAlign: TextAlign.start,
                            style: TextStyle(fontSize: 10.0.fontSize(context)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ]),
                  ),
                  if (_service.shop.shopImagesSmall.length > 0)
                    GridView.count(
                      physics:
                          ScrollPhysics(parent: NeverScrollableScrollPhysics()),
                      shrinkWrap: true,
                      crossAxisSpacing: 0,
                      crossAxisCount: 3,
                      mainAxisSpacing: 0,
                      children: List.generate(
                        _service.shop.shopImagesSmall.length,
                        (index) => Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Container(
                            height: 350,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border: Border.all(color: black, width: 0),
                                // boxShadow: [
                                //   BoxShadow(
                                //     color: Colors.black.withOpacity(0.3),
                                //     spreadRadius: 2,
                                //     blurRadius: 2,
                                //     offset: Offset(
                                //         0, 1), // changes position of shadow
                                //   ),
                                // ],
                                borderRadius: BorderRadius.circular(0),
                                color: color(context)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(0),
                              child: Image(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    _service.shop.shopImagesSmall[index]),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
