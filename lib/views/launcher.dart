import 'package:flutter/material.dart';

class Launcher extends StatelessWidget {
  void goToNext(BuildContext context) {
    new Future.delayed(
      Duration(seconds: 2),
//      () => Navigator.pushNamed(context, 'walkthrough'),
    );
  }

  @override
  Widget build(BuildContext context) {
    this.goToNext(context);
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SizedBox(
            width: screen.width,
            height: screen.height,
            child: Image.asset(
              'images/launcher/background.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: screen.height * 0.30,
              left: screen.width * 0.5 - 52,
            ),
            child: Column(
              children: <Widget>[
                Image.asset(
                  'images/launcher/logo.png',
                  width: 104,
                  height: 133,
                ),
                Text(
                  'app name'.toUpperCase(),
                  style: TextStyle(
                    fontFamily: 'SF Pro Text',
                    fontSize: 16.0,
                    height: 19.0 / 16.0,
                    letterSpacing: 0.9,
                    color: Color(0xFFFFFFFF),
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20.0,
            child: SizedBox(
              width: screen.width,
              child: Opacity(
                opacity: 0.6,
                child: Text(
                  'Copyright © 2017',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'SF Pro Text',
                    fontSize: 12.0,
                    height: 14.0 / 12.0,
                    letterSpacing: 2.0,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
