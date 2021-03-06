import 'package:flutter/material.dart';

class HorizontalPosterCard extends StatelessWidget {
  final Widget child;

  HorizontalPosterCard({this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 10.0,
      ),
      height: 170.0,
      width: 320.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0.0, 5.0),
            blurRadius: 5.0,
          )
        ],
      ),
      child: this.child,
    );
  }
}
