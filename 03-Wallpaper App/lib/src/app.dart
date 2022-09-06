import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:http/http.dart' show get; //we only need the "get" function!
import '../src/keys/keys.dart';
import 'widgets/image_list.dart';

import 'package:async_wallpaper/async_wallpaper.dart';


class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  var counter = 0;
  List urls = [];

  void fetchImage() async {
    print('fetch image');
    //counter++;
    var response = await get(Uri.parse('https://api.unsplash.com/photos/random?client_id=${Keys.UNSPLASH_API_CLIENT_ID}'));
    print('fetch image 2');
    var url = json.decode(response.body);
    //var imageModel = ImageModel.fromJson(json.decode(response.body));
    setState(() {
      urls.add(url);
    });
  }

  static void setWallpaper(String url, bool isHome) async{
    //a==0: Home Screen/ a==1 Lock Screen
    String result;
    int a;
    try {
      if(isHome){
        a = AsyncWallpaper.HOME_SCREEN;
      }else{
        a=AsyncWallpaper.LOCK_SCREEN;
      }

      result = await AsyncWallpaper.setWallpaper(
        url: url,
        wallpaperLocation: a,
       // goToHome: goToHome,
      )
          ? 'Wallpaper set'
          : 'Failed to get wallpaper.';
    } on PlatformException {
      result = 'Failed to get wallpaper.';
    }
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          title: Text('Wallpapers'),
        ),
        body: ImageList(urls),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed:fetchImage,)
        ,
      ),


    );
  }

}