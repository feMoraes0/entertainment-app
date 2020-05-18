import 'package:entertainmentapp/components/poster_card.dart';
import 'package:flutter/material.dart';
import 'package:entertainmentapp/constants.dart' as Constants;
import 'package:entertainmentapp/design_constants.dart' as kDesign;
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatelessWidget {
  List<Widget> buildVerticalPosterList({List movies}) {
    List<Widget> posters = [];
    movies.forEach((movie) {
      posters.add(
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            PosterCard(
              width: 140.0,
              height: 210.0,
              child: Image.asset(
                movie['img'],
              ),
            ),
            SizedBox(
              width: 140.0,
              child: Text(
                movie['name'],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'SF Pro Text',
                  fontSize: 15.0,
                  height: 18.0 / 15.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF222222),
                ),
              ),
            ),
          ],
        ),
      );
    });
    return posters;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.kBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 36.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Home',
                      style: TextStyle(
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                        height: 29.0 / 24.0,
                        color: Color(0xFF212121),
                      ),
                    ),
                    Icon(
                      Icons.search,
                      size: 30.0,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.0),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    children: <Widget>[
                      PosterCard(
                        height: 170.0,
                        width: 320.0,
                        child: Container(
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SvgPicture.asset(
                                'images/walkthrough/logo-icon.svg',
                                color: Constants.kRed,
                                height: 73.0,
                                width: 70.0,
                              ),
                              SizedBox(width: 20.0),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'MY FILM',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontFamily: 'SF Pro Display',
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  SizedBox(height: 7.0),
                                  Opacity(
                                    opacity: 0.5,
                                    child: Text(
                                      'V. 1.0',
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        height: 18.0 / 15.0,
                                        fontFamily: 'SF Pro Display',
                                        fontWeight: FontWeight.w300,
                                        color: Color(0xFF212121),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5.0),
                                  Text(
                                    'Get Started',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      height: 24.0 / 20.0,
                                      fontFamily: 'SF Pro Display',
                                      fontWeight: FontWeight.bold,
                                      color: Constants.kRed,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      PosterCard(
                        height: 170.0,
                        width: 320.0,
                        child: Image.asset(
                          kDesign.horizontalPosterMovies[0],
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  'Now',
                  style: Constants.kLabelSection,
                ),
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: this.buildVerticalPosterList(
                      movies: kDesign.verticalPosterMovies,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  'Popular',
                  style: Constants.kLabelSection,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
