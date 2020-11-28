import 'package:flutter/material.dart';
import 'package:movie_app/reusable_card.dart';

class MovieDetails extends StatefulWidget {
  final movie;
  var image_url = 'https://image.tmdb.org/t/p/w500/';
  MovieDetails(this.movie);
  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEDDFD),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Stack(
              alignment: Alignment.bottomLeft,
              fit: StackFit.passthrough,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 2 + 70,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: ClipRRect(
                    child: Center(),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, bottom: 30),
                  child: Text(
                    '',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          // bottomLeft
                          offset: Offset(-3.5, -3.0),
                          color: Colors.grey[800],
                        ),
                        Shadow(
                          // bottomLeft
                          offset: Offset(3.5, 3.0),
                          color: Colors.grey[800],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    '',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      shadows: [
                        Shadow(
                          // bottomLeft
                          offset: Offset(-1.5, -1.0),
                          color: Colors.grey[800],
                        ),
                        Shadow(
                          // bottomLeft
                          offset: Offset(1.5, 1.0),
                          color: Colors.grey[800],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ReusableCard(
                cardChild: Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    top: 3.0,
                    bottom: 3.0,
                    right: 20.0,
                  ),
                  child: Text(
                    'Action',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
              ReusableCard(
                cardChild: Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    top: 3.0,
                    bottom: 3.0,
                    right: 20.0,
                  ),
                  child: Text(
                    'Action',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
              ReusableCard(
                cardChild: Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    top: 3.0,
                    bottom: 3.0,
                    right: 20.0,
                  ),
                  child: Text(
                    'Action',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'An entire universe. Once and for all',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
                Text('Overview'),
                Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
                Text(
                  'A former soldier teams up with a cop to find the '
                  'source behind a dangerous pill that provides '
                  'temporary superpowers.',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
