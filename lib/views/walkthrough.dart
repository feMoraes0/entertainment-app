import 'package:entertainmentapp/components/background_image_walkthrough.dart';
import 'package:entertainmentapp/components/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:entertainmentapp/utilities/design_constants.dart' as kDesign;

const kButtonTextStyle = TextStyle(
  color: Color(0xFFFFFFFF),
  fontSize: 20.0,
  height: 24.0 / 20.0,
);

class Walkthrough extends StatefulWidget {
  @override
  _WalkthroughState createState() => _WalkthroughState();
}

class _WalkthroughState extends State<Walkthrough> {
  final pageController = new PageController(initialPage: 0);
  int currentPage = 0;

  Opacity paginationDot({double opacity}) {
    return Opacity(
      opacity: opacity,
      child: SvgPicture.asset(
        'images/walkthrough/logo-icon.svg',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFF222222),
      body: Stack(
        children: <Widget>[
          SizedBox(
            height: screen.height,
            width: screen.width,
            child: PageView(
              controller: this.pageController,
              onPageChanged: (int page) {
                setState(() {
                  currentPage = page;
                });
              },
              children: <Widget>[
                BackgroundImageWalkthrough(
                  urlImage: 'images/walkthrough/image-001.png',
                  colours: kDesign.walkthroughPages[0]['backgroundColors'],
                  opacity: 0.81,
                  auxMarginBottom: screen.height * 0.35,
                ),
                BackgroundImageWalkthrough(
                  urlImage: 'images/walkthrough/image-002.png',
                  colours: kDesign.walkthroughPages[1]['backgroundColors'],
                  opacity: 0.71,
                ),
                BackgroundImageWalkthrough(
                  urlImage: 'images/walkthrough/image-003.png',
                  colours: kDesign.walkthroughPages[2]['backgroundColors'],
                ),
              ],
            ),
          ),
          SizedBox(
            width: screen.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  kDesign.walkthroughPages[this.currentPage]['title'],
                  style: TextStyle(
                    fontSize: 34.0,
                    height: 41.0 / 34.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
                Text(
                  kDesign.walkthroughPages[this.currentPage]['subtitle'],
                  style: TextStyle(
                    fontSize: 34.0,
                    height: 41.0 / 34.0,
                    fontWeight: FontWeight.w100,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
                SizedBox(height: screen.height * 0.07),
                SizedBox(
                  width: screen.width * 0.24,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      paginationDot(
                          opacity: (this.currentPage == 0) ? 1.0 : 0.2),
                      paginationDot(
                          opacity: (this.currentPage == 1) ? 1.0 : 0.2),
                      paginationDot(
                          opacity: (this.currentPage == 2) ? 1.0 : 0.2),
                    ],
                  ),
                ),
                SizedBox(height: screen.height * 0.07),
                (this.currentPage == kDesign.walkthroughPages.length - 1)
                    ? Container(
                        width: screen.width * 0.51,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(27.0),
                          gradient: LinearGradient(
                            begin: Alignment.bottomRight,
                            end: Alignment.topLeft,
                            colors: [
                              Color(0xFFDB3069),
                              Color(0xFFF99F00),
                            ],
                          ),
                        ),
                        child: RoundedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'home');
                          },
                          child: Text(
                            'Get Stared',
                            textAlign: TextAlign.center,
                            style: kButtonTextStyle,
                          ),
                        ),
                      )
                    : RoundedButton(
                        onPressed: () {
                          pageController.jumpToPage(this.currentPage + 1);
                        },
                        borderColor: Color(0xFFFFFFFF),
                        width: screen.width * 0.51,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Next',
                              style: kButtonTextStyle,
                            ),
                            SizedBox(width: 10.0),
                            SvgPicture.asset(
                              'images/walkthrough/arrow-right-icon.svg',
                              color: Color(0xFFFFFFFF),
                            )
                          ],
                        ),
                      ),
                SizedBox(height: screen.height * 0.12),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
