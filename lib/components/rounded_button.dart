import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RoundedButton extends StatelessWidget {
  final Function onPressed;
  final Widget child;
  final Color borderColor;
  final double width;

  const RoundedButton({
    Key key,
    @required this.onPressed,
    @required this.child,
    this.width,
    this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        width: (this.width != null) ? this.width : double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(27.0),
          border: Border.all(
            color: borderColor != null ? borderColor : Colors.transparent,
            width: 2.0,
          ),
        ),
        child: this.child,
      ),
    );
  }
}
