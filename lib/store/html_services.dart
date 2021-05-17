// import 'dart:convert';

// import 'package:igpazar/models/shops.dart';


// class JsonParser {
//   List<dynamic> jsonList = [];
//   List<FirstShopInfo> allUrl = [
//     FirstShopInfo(
//         url: "https://www.instagram.com/morkavintage/",
//         category: ["sweatshirt", "t-shirt"],
//         gender: "unisex"),
//     FirstShopInfo(
//         url: "https://www.instagram.com/narferita/",
//         category: ["sweatshirt", "kazak", "ceket", "jeans"],
//         gender: "kadın"),
  
//     FirstShopInfo(
//         url: "https://www.instagram.com/jweelcosmetics/",
//         category: ["sweatshirt", "t-shirt"],
//         gender: "unisex"),
//     FirstShopInfo(
//         url: "https://www.instagram.com/mylovebutik/",
//         category: ["sweatshirt", "t-shirt"],
//         gender: "unisex"),
//     FirstShopInfo(
//         url: "https://www.instagram.com/lostinwear/",
//         category: ["sweatshirt", "t-shirt"],
//         gender: "unisex"),
//     FirstShopInfo(
//         url: "https://www.instagram.com/morkavintage/",
//         category: ["sweatshirt", "t-shirt"],
//         gender: "unisex"),
//     FirstShopInfo(
//         url: "https://www.instagram.com/morkavintage/",
//         category: ["sweatshirt", "t-shirt"],
//         gender: "unisex"),
//     FirstShopInfo(
//         url: "https://www.instagram.com/morkavintage/",
//         category: ["sweatshirt", "t-shirt"],
//         gender: "unisex"),
//     FirstShopInfo(
//         url: "https://www.instagram.com/morkavintage/",
//         category: ["sweatshirt", "t-shirt"],
//         gender: "unisex"),
//     FirstShopInfo(
//         url: "https://www.instagram.com/morkavintage/",
//         category: ["sweatshirt", "t-shirt"],
//         gender: "unisex"),
//     FirstShopInfo(
//         url: "https://www.instagram.com/morkavintage/",
//         category: ["sweatshirt", "t-shirt"],
//         gender: "unisex"),
//   ];
//   List<String> imageList = [];
//   List<String> imageListSmall = [];
//   List<Shop> shopList = [];
//   String imageProfil;
//   int follower;
//   String name;
//   String biography;
//   var url;
//   var urlParseHtml;
//   var jsonString;
//   var jsonResponse;
//   var shopImages;
//   List<String> htmllist = [];
//   Shop shop = new Shop();

//   Future<List<Shop>> getShops() async {
//     int sayac = 0;

//     for (var itemUrl in allUrl) {
//       // if ((allUrl.length) / 2 == sayac) {
//       //   break;
//       // }
//       url = await http.get(itemUrl.url);
//       urlParseHtml = parse(url.body);
//       // print(urlParseHtml.outerHtml);

//       jsonString = urlParseHtml
//           .getElementsByTagName("body")[0]
//           .getElementsByTagName("script")[0]
//           .text;
//       jsonString = jsonString
//           .replaceAll("window._sharedData = ", "")
//           .replaceAll(";", "");

//       htmllist = jsonString.split(',"hostname"');

//       htmllist[0] = htmllist[0] + "}";

//       jsonResponse = json.decode(htmllist[0]);

//       //print("json kodu" + jsonResponse);

//       imageProfil = jsonResponse['entry_data']['ProfilePage'][0]['graphql']
//           ['user']['profile_pic_url_hd'];

//       follower = jsonResponse['entry_data']['ProfilePage'][0]['graphql']['user']
//           ['edge_followed_by']['count'];

//       name = jsonResponse['entry_data']['ProfilePage'][0]['graphql']['user']
//           ['full_name'];

//       biography = jsonResponse['entry_data']['ProfilePage'][0]['graphql']
//           ['user']['biography'];

//       shopImages = jsonResponse['entry_data']['ProfilePage'][0]['graphql']
//           ['user']['edge_owner_to_timeline_media']['edges'] as List;

//       shopImages.forEach((element) {
//         imageList.add(element['node']['display_url']);
//         imageListSmall.add(element['node']['thumbnail_resources'][2]['src']);
//       });

//       shopList.add(Shop(
//           shopName: name,
//           shopBiography: biography,
//           shopFollower: follower.toString(),
//           shopImage: imageProfil,
//           shopImagesLarge: imageList,
//           shopImagesSmall: imageListSmall));

//       sayac++;
//     }

//     return shopList;
//   }
// }
