import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:igpazar/models/discovery.dart';
import 'package:igpazar/models/shops.dart';
import 'package:igpazar/shops.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
part 'services.g.dart';

class ServicesFromNetworkStore = ServicesFromNetworkBase
    with _$ServicesFromNetworkStore;

abstract class ServicesFromNetworkBase with Store {
  @observable
  List<Shop> _shopList = new ObservableList();

  List<dynamic> jsonList = [];

  List<String> imageList = [];
  List<String> imageListSmall = [];
  @observable
List<Discovery> _discoveryList = new ObservableList();



  String imageProfil;
  int follower;
  String name;
  String biography;
  var url;
  var urlParseHtml;
  var jsonString;
  var jsonResponse;
  var shopImages;
  List<String> htmllist = [];
  Shop shop = new Shop();

  List<Shop> get shopList => _shopList;
   List<Discovery> get discoveryList => _discoveryList;

  Dio _dio = Dio();

  

  @action
  Future<List<Shop>> getShops(context) async {

        _dio.options.headers['Access-Control-Allow-Origin'] = '*';
    for (var itemUrl in Shops.shopUrlList) {
      print(itemUrl.url);

      //response = await http.get(Uri.parse(itemUrl.url));
      // response = await http.get(Uri.https(itemUrl.url+"?__a=1"));

      var response = await _dio.get(itemUrl.url,);

      if (response.statusCode == 200) {
        //print(response.body);
        jsonResponse = response.data;

        imageProfil = jsonResponse['graphql']['user']['profile_pic_url_hd'];
        follower = jsonResponse['graphql']['user']['edge_followed_by']['count'];
        name = jsonResponse['graphql']['user']['username'];
        biography = jsonResponse['graphql']['user']['biography'];
        shopImages = jsonResponse['graphql']['user']
            ['edge_owner_to_timeline_media']['edges'] as List;


        shopImages.forEach((element) {
          imageList.add(element['node']['display_url']);

        

          _discoveryList.add(Discovery(shopImage:imageProfil,shopName: name,shopImagesLarge:element['node']['display_url']  ));


          imageListSmall.add(element['node']['thumbnail_resources'][2]['src']);
        });


        

        _shopList.add(Shop(
            shopName: name,
            follower: follower,
            shopBiography: biography,
            shopFollower: follower.toString(),
            shopImage: imageProfil,
            shopImagesLarge: imageList,
            shopImagesSmall: imageListSmall));
      }

      print(imageList.length.toString());
      print(imageListSmall.length.toString());

  imageList.clear();
   imageListSmall.clear();

    }

   _discoveryList.shuffle();

    return _shopList;
  }

  Future igAuth() async {
    Dio _dio = Dio();
    var data = {
      "client_id": "1177288659409487",
      "redirect_uri": "https://httpstat.us/200",
      "scope": "user_profile,user_media",
      "response_type": "code"
    };

    Response _res = await _dio.get("https://api.instagram.com/oauth/authorize",
        queryParameters: data);

    print(_res.data);

    return _res.data;
  }
}
