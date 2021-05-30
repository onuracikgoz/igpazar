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
  ObservableList<Shop> _shopList = new ObservableList();

  ObservableList<dynamic> jsonList = ObservableList();


@observable
Shop _shop = Shop();




  List<String> _imageList =[];
  List<String> _imageListSmall =[];
  @observable
  ObservableList<Discovery> _discoveryList = new ObservableList();

  String imageProfil;
  int follower;
  String name;
  String biography;
  var jsonResponse;
  var shopImages;
  String id;
 
  Shop get shop => _shop;
  ObservableList<Shop> get shopList => _shopList;
  ObservableList<Discovery> get discoveryList => _discoveryList;

  Dio _dio = Dio();

  @action
  Future<List<Shop>> getShops(context) async {
    _dio.options.headers['Access-Control-Allow-Origin'] = '*';
    for (var itemUrl in Shops.shopUrlList) {

        _imageList.clear();
      _imageListSmall.clear();
      print(itemUrl.url);

      //response = await http.get(Uri.parse(itemUrl.url));
      // response = await http.get(Uri.https(itemUrl.url+"?__a=1"));

      var response = await _dio.get(
        itemUrl.url,
      );

      if (response.statusCode == 200) {
        //print(response.body);
        jsonResponse = response.data;
        id = jsonResponse['graphql']['user']['id'];
        imageProfil = jsonResponse['graphql']['user']['profile_pic_url_hd'];
        follower = jsonResponse['graphql']['user']['edge_followed_by']['count'];
        name = jsonResponse['graphql']['user']['username'];
        biography = jsonResponse['graphql']['user']['biography'];
        shopImages = jsonResponse['graphql']['user']
            ['edge_owner_to_timeline_media']['edges'] as List;

        shopImages.forEach((element) {
          _imageList.add(element['node']['display_url']);
         _imageListSmall.add(element['node']['thumbnail_resources'][2]['src']);


         print(element['node']['thumbnail_resources'][2]['src']);
          _discoveryList.add(Discovery(
              id: id,
              shopImage: imageProfil,
              shopName: name,
              shopImagesLarge: element['node']['display_url']));
       
        });

        _shopList.add(Shop(
            id: id,
            shopName: name,
            follower: follower,
            shopBiography: biography,
            shopFollower: follower.toString(),
            shopImage: imageProfil,
            shopImagesLarge: _imageList,
            shopImagesSmall: _imageListSmall));
      }
               print("id");
               print(id);

   //   print(imageList.length.toString());
      print("imageListSmall.length.toString()");
      print(_imageListSmall.length.toString());

    
    }

    //_discoveryList.shuffle();

    return _shopList;



  }


@action
getShopById (id){


  _shop =
      _shopList.firstWhere((element) => element.id == id);

}


}
