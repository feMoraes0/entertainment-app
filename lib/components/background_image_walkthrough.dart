import 'package:flutter/material.dart';

class BackgroundImageWalkthrough extends StatelessWidget {
  final String urlImage;
  final List colours;
  final double opacity;
  final double auxMarginBottom;

  BackgroundImageWalkthrough({
    @required this.urlImage,
    this.colours,
    this.opacity = 1.0,
    this.auxMarginBottom,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Stack(
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            child: Image.asset(
              this.urlImage,
              fit: BoxFit.cover,
            ),
          ),
          (auxMarginBottom != null)
              ? Container(
            margin: EdgeInsets.only(
              bottom: auxMarginBottom,
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Color(0xFF222222),
                  Color.fromRGBO(34, 34, 34, 0.0001),
                ],
              ),
            ),
          )
              : Container(),
          Opacity(
            opacity: opacity,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: colours,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
