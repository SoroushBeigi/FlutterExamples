import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' show get; //we only need the "get" function!
import 'package:pics/src/keys/keys.dart';
import 'widgets/image_list.dart';
import 'models/image_model.dart';

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

    //counter++;
    var response = await get(Uri.parse('https://api.unsplash.com/photos/random?client_id=${Keys.UNSPLASH_API_CLIENT_ID}'));
    var url = json.decode(response.body);
    //var imageModel = ImageModel.fromJson(json.decode(response.body));
    setState(() {
      urls.add(url);
    });
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