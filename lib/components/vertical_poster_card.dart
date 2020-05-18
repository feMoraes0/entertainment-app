import 'package:flutter/material.dart';

class VerticalPosterCard extends StatelessWidget {
  final Widget child;

  VerticalPosterCard({this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210,
      width: 140,
      margin: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0.0, 5.0),
            blurRadius: 5.0,
          ),
        ],
      ),
      child: this.child,
    );
  }
}
