import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:igpazar/models/shops.dart';

class JsonParser {
  List<dynamic> jsonList = [];

  List<String> imageList = [];
  List<String> imageListSmall = [];
  List<Shop> shopList = [];
  String imageProfil;
  int follower;
  String name;
  String biography;
  var url;
  var urlParseHtml;
  var jsonString;
  List jsonResponse;
  var shopImages;
  List<String> htmllist = [];
  Shop shop = new Shop();

  Future<List<Shop>> getShops() async {
    jsonString = await rootBundle.loadString("json/companies.json");
    jsonResponse = json.decode(jsonString);

    for (var i = 0; i < jsonResponse.length; i++) {
      imageProfil = jsonResponse[i]['graphql']['user']['profile_pic_url_hd'];

      follower =
          jsonResponse[i]['graphql']['user']['edge_followed_by']['count'];

      name = jsonResponse[i]['graphql']['user']['full_name'];

      biography = jsonResponse[i]['graphql']['user']['biography'];

      shopImages = jsonResponse[i]['graphql']['user']
          ['edge_owner_to_timeline_media']['edges'] as List;

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

    print(imageList.length.toString());
    print(imageListSmall.length.toString());
    return shopList;
  }
}
