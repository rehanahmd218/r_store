import 'package:flutter/material.dart';

class RProductTitle extends StatelessWidget {
  const RProductTitle({
    super.key, required this.title,  this.isSmall=true, this.maxLines=2, this.textAlign=TextAlign.left,
    
  });

  final String title;
  final bool isSmall;
  final int maxLines;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(title,maxLines: maxLines,overflow: TextOverflow.ellipsis,
      style:isSmall ?  Theme.of(context).textTheme.labelMedium!.apply(fontWeightDelta: 4):Theme.of(context).textTheme.titleSmall!.apply(
        fontWeightDelta: 4
      ),);
  }
}