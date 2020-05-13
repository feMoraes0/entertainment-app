import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Walkthrough extends StatefulWidget {
  @override
  _WalkthroughState createState() => _WalkthroughState();
}

class _WalkthroughState extends State<Walkthrough> {
  final pageController = new PageController(initialPage: 0);
  int currentPage = 0;
  List<Map> textPages = [
    {'title': 'Get the first', 'subtitle': 'Movie & TV information'},
    {'title': 'Know the movie', 'subtitle': 'is not worth Watching'},
    {'title': 'Real-time', 'subtitle': 'updates movie Trailer'},
  ];
  List<List<Color>> colorsBackground = [
    [Color(0xFFDB3167), Color.fromRGBO(245, 144, 14, 0.170771)],
    [Color(0xFFF5D547), Color.fromRGBO(245, 213, 71, 0.0001)],
    [Color(0xFF142246), Color.fromRGBO(52, 92, 197, 0.0001)],
  ];

  void nextPage() {
    pageController.jumpToPage(this.currentPage + 1);
  }

  void startApp() {}

  Opacity page(double opacity) {
    return Opacity(
      opacity: opacity,
      child: SvgPicture.asset(
        'images/walkthrough/logo-icon.svg',
      ),
    );
  }

  Stack background({
    int page,
    List colors,
    double opacity = 1.0,
    double auxMarginBottom,
  }) {
    return Stack(
      children: <Widget>[
        SizedBox(
          width: double.infinity,
          child: Image.asset(
            'images/walkthrough/image-00$page.png',
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
                colors: colors,
              ),
            ),
          ),
        ),
      ],
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
                SizedBox(
                  width: screen.width,
                  height: screen.height,
                  child: this.background(
                    page: 1,
                    colors: this.colorsBackground[0],
                    opacity: 0.81,
                    auxMarginBottom: screen.height * 0.35,
                  ),
                ),
                SizedBox(
                  width: screen.width,
                  height: screen.height,
                  child: this.background(
                    page: 2,
                    colors: this.colorsBackground[1],
                    opacity: 0.71,
                  ),
                ),
                SizedBox(
                  width: screen.width,
                  height: screen.height,
                  child: this.background(
                    page: 3,
                    colors: this.colorsBackground[2],
                  ),
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
                  this.textPages[this.currentPage]['title'],
                  style: TextStyle(
                    fontSize: 34.0,
                    height: 41.0 / 34.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    bottom: screen.height * 0.07,
                  ),
                  child: Text(
                    this.textPages[this.currentPage]['subtitle'],
                    style: TextStyle(
                      fontSize: 34.0,
                      height: 41.0 / 34.0,
                      fontWeight: FontWeight.w100,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                ),
                SizedBox(
                  width: screen.width * 0.24,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      page((this.currentPage == 0) ? 1.0 : 0.2),
                      page((this.currentPage == 1) ? 1.0 : 0.2),
                      page((this.currentPage == 2) ? 1.0 : 0.2),
                    ],
                  ),
                ),
                (this.currentPage == this.textPages.length - 1)
                    ? GestureDetector(
                        onTap: () => this.startApp(),
                        child: Container(
                          margin: EdgeInsets.only(
                            top: screen.height * 0.07,
                            bottom: screen.height * 0.12,
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 15.0,
                          ),
                          width: screen.width * 0.51,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(27.0),
                            border: Border.all(
                              color: Colors.transparent,
                              width: 2.0,
                            ),
                            gradient: LinearGradient(
                                begin: Alignment.bottomRight,
                                end: Alignment.topLeft,
                                colors: [
                                  Color(0xFFDB3069),
                                  Color(0xFFF99F00),
                                ]),
                          ),
                          child: Text(
                            'Get Stared',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontSize: 20.0,
                              height: 24.0 / 20.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () => this.nextPage(),
                        child: Container(
                          margin: EdgeInsets.only(
                            top: screen.height * 0.07,
                            bottom: screen.height * 0.12,
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 15.0,
                          ),
                          width: screen.width * 0.51,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(27.0),
                            border: Border.all(
                              color: Color(0xFFFFFFFF),
                              width: 2.0,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Next',
                                style: TextStyle(
                                  color: Color(0xFFFFFFFF),
                                  fontSize: 20.0,
                                  height: 24.0 / 20.0,
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              SvgPicture.asset(
                                'images/walkthrough/arrow-right-icon.svg',
                                color: Color(0xFFFFFFFF),
                              )
                            ],
                          ),
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
