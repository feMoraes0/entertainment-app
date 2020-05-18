import 'package:entertainmentapp/components/horizontal_poster_card.dart';
import 'package:flutter/material.dart';
import 'package:entertainmentapp/constants.dart' as Constants;
import 'package:entertainmentapp/design_constants.dart' as kDesign;

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.kBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
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
              SizedBox(height: 20.0),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    children: <Widget>[
                      HorizontalPosterCard(
                        child: Container(
                          color: Colors.white,
                          child: Row(
                            children: <Widget>[

                            ],
                          ),
                        ),
                      ),
                      HorizontalPosterCard(
                        child: Image.asset(
                          kDesign.horizontalMoviePosters[0],
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
