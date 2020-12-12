import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:igpazar/models/shops.dart';

class JsonParser {
  List<String> imageList = [];
  List<String> imageListSmall = [];
  List<Shop> shopList = [];
  String imageProfil;
  int follower;
  String name;
  String biography;
  Shop shop = new Shop();

  Future<List<Shop>> getShops() async {
    String jsonString = await rootBundle.loadString('json/companies.json');

    final jsonResponse = json.decode(jsonString);

    for (var i = 0; i < jsonResponse.length; i++) {
      imageProfil = jsonResponse[i]['entry_data']['ProfilePage'][0]['graphql']
          ['user']['profile_pic_url_hd'];
      follower = jsonResponse[i]['entry_data']['ProfilePage'][0]['graphql']
          ['user']['edge_followed_by']['count'];
      name = jsonResponse[i]['entry_data']['ProfilePage'][0]['graphql']['user']
          ['full_name'];
      biography = jsonResponse[i]['entry_data']['ProfilePage'][0]['graphql']
          ['user']['biography'];

      var shopImages = jsonResponse[i]['entry_data']['ProfilePage'][0]
          ['graphql']['user']['edge_owner_to_timeline_media']['edges'] as List;

      shopImages.forEach((element) {
        imageList.add(element['node']['display_url']);
        imageListSmall.add(element['node']['thumbnail_resources'][2]['src']);
      });

      shopList.add(Shop(
          shopName: name,
          shopBiography: biography,
          shopFollower: follower.toString(),
          shopImage: imageProfil,
          shopImagesLarge: imageList,
          shopImagesSmall: imageListSmall));
    }

    return shopList;
  }
}
