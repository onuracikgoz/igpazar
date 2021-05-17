// import 'dart:convert';

// import 'package:igpazar/models/shops.dart';
// import 'package:igpazar/shops.dart';

// class ServicesFromNetwork {
//   List<dynamic> jsonList = [];
 
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

//     for (var itemUrl in Shops.shopUrlList) {
//       if ((Shops.shopUrlList.length) / 2 == sayac) {
//         break;
//       }
//       url = await http.get(itemUrl.url + "?__a=1");
//       urlParseHtml = parse(url.body);
     
      
//       jsonResponse = json.decode(url.body);


//       print(jsonResponse.toString());
      

//       imageProfil = jsonResponse['graphql']['user']['profile_pic_url_hd'];

//       follower = jsonResponse['graphql']['user']['edge_followed_by']['count'];

//       name = jsonResponse['graphql']['user']['full_name'];

//       biography = jsonResponse['graphql']['user']['biography'];

//       shopImages = jsonResponse['graphql']['user']
//           ['edge_owner_to_timeline_media']['edges'] as List;

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
// print(imageList.length.toString());
//       print(imageListSmall.length.toString());
//     return shopList;
//   }
// }
