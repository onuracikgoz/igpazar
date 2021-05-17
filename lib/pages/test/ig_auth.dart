import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:igpazar/store/services.dart';
import 'package:igpazar/pages/test/webview.dart';
import 'package:provider/provider.dart';
import 'package:simple_auth/simple_auth.dart' as simpleAuth;
import 'package:simple_auth_flutter/simple_auth_flutter.dart';

class IgAuth extends StatefulWidget {
  @override
  _IgAuthState createState() => _IgAuthState();
}

class _IgAuthState extends State<IgAuth> {

  // final simpleAuth.InstagramApi _igApi = simpleAuth.InstagramApi(
  //   "instagram",
  //   "1177288659409487",
  //   "5dd9f0c2f8a6406bad43507097a46a2a",
  // "https://httpstat.us/200",
  //   scopes: [
  //     'user_profile', // For getting username, account type, etc.
  //     'user_media', // For accessing media count & data like posts, videos etc.
  //   ],
  // );


  String url;

  @override
  void initState() {

    Future.microtask(() async{
      
      
     url= await Provider.of<ServicesFromNetworkStore>(context, listen: false).igAuth();
    
    
    });

   
      super.initState();
       //SimpleAuthFlutter.init(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Container(color: Colors.black,
      child: InkWell(
        
        onTap: ()async{
         //   await _loginAndGetData();



           Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => WebViewExample(url))) ;

        },
        child: Text("IG ACCOUNT",style: TextStyle(color: Colors.white,fontSize:50),)),),),




      
      
    );
  }



  //  Future<void> _loginAndGetData() async {
  //   _igApi.authenticate().then(
  //     (simpleAuth.Account _user) async {
  //       simpleAuth.OAuthAccount user = _user;

  //       var igUserResponse =
  //           await Dio(BaseOptions(baseUrl: 'https://graph.instagram.com')).get(
  //         '/me',
  //         queryParameters: {
       
  //           "fields": "username,id,account_type,media_count",
  //           "access_token": user.token,
  //         },
  //       );
//id 18227534


   //  print(igUserResponse.data);

// Dio _dio = Dio();
// var data = {
//       "client_id": "1177288659409487",
//      "redirect_uri": "https://httpstat.us/200",
//       "scope": "user_profile,user_media",
//       "response_type": "code"
//     };



//       _dio.get("https://graph.instagram.com/me");
//     Response _res = await _dio.get("https://api.instagram.com/18227534/media?access_token={access-token}",
//         queryParameters: data);

//       },
//     ).catchError(
//       (Object e) {
//       print(e);
//       },
//     );
//   }
}