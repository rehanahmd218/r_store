import 'package:flutter/material.dart';
import 'package:r_store/utils/constants/colors.dart';

class RCircularContainer extends StatelessWidget {
  const RCircularContainer({
    super.key,
    this.child,
    this.width = 400,
    this.height = 400,
    this.padding = 0,
    this.color = RColors.textWhite,
    this.margin,
  });
  final Color color;
  final double? width;
  final double? height;
  final double padding;
  final Widget? child;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(width ?? 0),
      ),
    );
  }
}
