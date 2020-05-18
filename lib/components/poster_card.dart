import 'package:flutter/material.dart';

class PosterCard extends StatelessWidget {
  final Widget child;
  final double height;
  final double width;

  const PosterCard({
    Key key,
    this.height,
    this.width,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
      height: this.height,
      width: this.width,
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
