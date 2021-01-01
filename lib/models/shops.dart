class Shop {
  String shopName;
  String shopImage;
  String shopFollower;
  String shopBiography;
  List<String> shopImagesSmall;
  List<String> shopImagesLarge;

  Shop(
      {this.shopName,
      this.shopImage,
      this.shopFollower,
      this.shopBiography,
      this.shopImagesSmall,
      this.shopImagesLarge});
}

class FirstShopInfo {
  String url;
  List<String> category;
  String gender;

  FirstShopInfo({this.url, this.category, this.gender});
}
