import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/movie_details.dart';
import 'package:movie_app/reusable_card.dart';
import 'package:swipedetector/swipedetector.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Text title = Text('MovieApp');
  double sliderPosition = 1.0;
  @override
  Widget build(BuildContext context) {
    print(sliderPosition);
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
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MovieDetails(),
                    ),
                  );
                },
                child: SwipeDetector(
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
              itemCount: 5,
              itemBuilder: (context, i) {
                return Container(
                  height: 100,
                  child: Column(
                    children: [
                      ReusableCard(
                        // colour: Colors.blue,
                        height: 160,
                        width: 97,
                        cardChild: Image.asset(
                          'images/projectpower.jpeg',
                          fit: BoxFit.fill,
                        ),
                      ),
                      Text(
                        'Project Power',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.normal),
                      ),
                      Row(
                        children: [
                          Text(
                            '2020',
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.normal),
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20)),
                          Text(
                            '6.7⭐',
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.normal),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}