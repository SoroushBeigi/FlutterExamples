import 'dart:math';

import 'package:flutter/material.dart';
import 'package:movie/Movie.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'COMIC',
        primarySwatch: Colors.deepPurple,
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        ),
      ),
      home: const MyHomePage(title: 'Movie Recommendation'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState(title);
}

class _MyHomePageState extends State<MyHomePage> {
  String title;
  _MyHomePageState(this.title);
  TextEditingController controller = new TextEditingController();

  Random r = new Random();
  var child = [
    Movie(
        'https://images-na.ssl-images-amazon.com/images/S/pv-target-images/9776c9ba3f079576c708cd7d73eef84cbb33141a30f97fcebd2cc12c9e2f72ce._SX1080_.jpg',
        'SpongeBob'),
    Movie(
        'https://static.wikia.nocookie.net/tomandjerry/images/a/af/Bandicam_2019-11-01_09-13-40-754.png',
        'Tom and Jerry'),
    Movie(
        'https://static.wikia.nocookie.net/pinkpanther/images/d/dd/EBPP.png/revision/latest?cb=20180715182133',
        'The Pink Panther'),
  ];
  var young = [
    Movie(
        'https://m.media-amazon.com/images/M/MV5BZDhmNGQ5MDItMWE0NS00ZTNlLTk5YzAtMzk0MDU4NGNhMTdiXkEyXkFqcGdeQXVyMTE0MTQxNjgx._V1_.jpg',
        'Fight Club'),
    Movie(
        'https://occ-0-58-586.1.nflxso.net/dnm/api/v6/X194eJsgWBDE2aQbaNdmCXGUP-Y/AAAABRgDUGyK1dOLu-1oQTL2nICMeLuMQC1mAoLTWpcWtyixOdM2fhew7hbzk9ahd6IfCuw7flvEHIH8FvH8zzA2ACTvD3tHargj7OYB.jpg?r=157',
        'The Dark Knight'),
    Movie(
        'https://bahaiteachings.s3.us-west-1.amazonaws.com/2014/12/The-Mystical-Meanings-of-the-Movie-Interstellar.jpg',
        'Interstellar'),
  ];
  var old = [
    Movie(
        'https://charactersonthecouch.com/wp-content/uploads/2019/05/the-seventh-seal-chess-scene-1108x0-c-default.jpg',
        'The Seventh Seal'),
    Movie(
        'https://s3.amazonaws.com/static.rogerebert.com/uploads/review/primary_image/reviews/great-movie-12-angry-men-1957/EB20020929REVIEWS08209290301AR.jpg',
        '12 Angry Men'),
    Movie(
        'https://m.media-amazon.com/images/M/MV5BMTcwMzU5NTMzNF5BMl5BanBnXkFtZTcwNDQ2MjM2NQ@@._V1_.jpg',
        'Persona'),
  ];
  String img = '', name = '';
  bool isVisivle = false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
          margin: EdgeInsets.only(top: 30),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Text(
                    'Welcome ;)\n How old are you?',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('I\'m'),
                        SizedBox(
                          width: 50,
                          child: TextField(
                            onEditingComplete: () {
                              print('yay');
                            },
                            textAlign: TextAlign.center,
                            maxLength: 2,
                            showCursor: false,
                            decoration: InputDecoration(counterText: '',
                            hintText: '18',
                                hintStyle: TextStyle(color: Colors.grey[700]),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.deepPurpleAccent),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.purpleAccent),
                              ),
                            ),
                            controller: controller,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        Text('years old!'),
                        Container(
                            width: 125,
                            height: 40,
                            margin: EdgeInsets.only(left: 50),
                            child: ElevatedButton(
                                onPressed: () {
                                  movieRecom(int.parse(controller.text));
                                },
                                child: Text(
                                  'Done',
                                  style: TextStyle(fontSize: 16),
                                )))
                      ],
                    ),
                  ),
                  Container(
                    height: 400,
                    margin: EdgeInsets.only(top: 30),
                    child: Visibility(
                      visible: isVisivle,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: SizedBox(
                              width: width * 0.75,
                              height: width / 2,
                              child: Image.network(
                                img,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Text(
                            name,
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w600
                            ),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  isVisivle = false;
                                  controller.text = '';
                                });
                              },
                              child: Text('Restart'))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }

  void movieRecom(int age) {
    setState(() {
      var index = r.nextInt(3);
      if (age < 18) {
        img = child[index].imageSrc;
        name = child[index].name;
        isVisivle = true;
      } else if (18 <= age && age < 50) {
        img = young[index].imageSrc;
        name = young[index].name;
        isVisivle = true;
      } else {
        img = old[index].imageSrc;
        name = old[index].name;
        isVisivle = true;
      }
    });
  }
}
