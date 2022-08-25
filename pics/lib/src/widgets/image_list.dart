import 'package:flutter/material.dart';
import '../models/image_model.dart';



class ImageList extends StatelessWidget {
  List images;

  ImageList(this.images);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return ListView.builder(
      itemCount: images.length,
      itemBuilder: (context, int index) {
        return Center(
          child: Container(
            margin: EdgeInsets.only(top:20),
            width: width/2,
            child: Column(
              children: [
                Image.network(images[index]['urls']['regular']),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Save Image'),
                    style: ButtonStyle(),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Set as Wallpaper'),
                    style: ButtonStyle(),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Set as Lockscreen'),
                    style: ButtonStyle(),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
