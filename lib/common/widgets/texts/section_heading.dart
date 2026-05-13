import 'package:flutter/material.dart';

class RSectionHeading extends StatelessWidget {
  final Color? textColor;
  final bool showActionButton;
  final String title, buttonTitle;
  final void Function()? onButtonPressed;

  const RSectionHeading({
    super.key,
    this.textColor,
    this.showActionButton = true,
    this.title = 'Popular Categories',
    this.buttonTitle = 'View All',
    this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(
            context,
          ).textTheme.headlineSmall!.apply(color: textColor),
        ),
        if (showActionButton)
          TextButton(onPressed: onButtonPressed, child: Text(buttonTitle, style: Theme.of(context).textTheme.labelLarge)),
      ],
    );
  }
}
