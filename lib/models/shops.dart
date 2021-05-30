import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';

class Shop {
  String id;
  String shopName;
  String shopImage;
  String shopFollower;
  String shopBiography;
  int follower;
  List<String> shopImagesSmall;
  List<String> shopImagesLarge;
  

  Shop(
      {
        this.id,
        this.shopName,
      this.shopImage,
      this.shopFollower,
      this.shopBiography,
      this.shopImagesSmall,
      this.shopImagesLarge,
      this.follower});
}

class FirstShopInfo {
  String url;
  List<String> category;
  String gender;

  FirstShopInfo({this.url, this.category, this.gender});
}
