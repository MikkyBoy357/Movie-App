import 'dart:convert';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/movie_details.dart';
import 'package:movie_app/reusable_card.dart';
import 'package:swipedetector/swipedetector.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Text title = Text('MovieApp');
  var image_url;
  var movies;
  var overview;
  var movieTitle;
  var releaseDate;
  var voteAverage;

  getMovies() async {
    http.Response response = await http.get(
        'https://api.themoviedb.org/3/movie/550?api_key=34baee43a0c7f15987e896eee3d30b82');
    var results = jsonDecode(response.body);
  }

  double sliderPosition = 1.0;

  void getData() async {
    var data = await getJson();

    setState(() {
      movies = data['results'];
      image_url = 'https://image.tmdb.org/t/p/w500/';
      movieTitle = movies[0]['title'];
    });
  }

  @override
  Widget build(BuildContext context) {
    getData();
    getMovies();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Icon(Icons.menu),
        centerTitle: true,
        title: title,
        actions: [
          Icon(Icons.search),
          Padding(padding: EdgeInsets.only(left: 18))
        ],
      ),
      backgroundColor: Color(0xFFEEDDFD),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text('Discover'),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SwipeDetector(
                onSwipeRight: () {
                  sliderPosition > 0 ? sliderPosition-- : sliderPosition = 0;
                  setState(() {
                    print(sliderPosition);
                  });
                },
                onSwipeLeft: () {
                  sliderPosition < 2 ? sliderPosition++ : sliderPosition = 2;
                  setState(() {
                    print(sliderPosition);
                  });
                },
                child: ReusableCard(
                  height: MediaQuery.of(context).size.height / 3.3,
                  width: MediaQuery.of(context).size.width,
                  cardChild: ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(13.0),
                    ),
                    child: Image.asset(
                      sliderPosition == 1
                          ? 'images/projectpower2.jpeg'
                          : 'images/avengers.jpeg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              DotsIndicator(
                dotsCount: 3,
                position: sliderPosition,
                decorator: DotsDecorator(
                  activeColor: Colors.black,
                  size: const Size(18.0, 5.0),
                  activeSize: const Size(18.0, 5.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
            child: Text('Trending'),
          ),
          Container(
            margin: EdgeInsets.only(right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
                  child: Text(
                    'Today',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                Text(
                  'See all',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                )
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 3.3,
            width: MediaQuery.of(context).size.width,
            // color: Colors.blue,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movies == null ? 0 : movies.length,
              itemBuilder: (context, i) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MovieDetails(movies[i]),
                      ),
                    );
                  },
                  child: Container(
                    height: 100,
                    child: Column(
                      children: [
                        ReusableCard(
                          // colour: Colors.blue,
                          height: 160,
                          width: 97,
                          cardChild: Image(
                            image: NetworkImage(
                              image_url + movies[i]['poster_path'],
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              width: 150.0,
                              child: Column(
                                children: [
                                  Text(
                                    movies[i]['title'],
                                    overflow: TextOverflow.clip,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              '$releaseDate',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                            ),
                            Text(
                              '$voteAverage⭐',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

Future<Map> getJson() async {
  var apiKey = '34baee43a0c7f15987e896eee3d30b82';
  var url = 'http://api.themoviedb.org/3/discover/movie?api_key=${apiKey}';
  var response = await http.get(url);
  return json.decode(response.body);
}
