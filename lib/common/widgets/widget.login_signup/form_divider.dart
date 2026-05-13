import 'package:flutter/material.dart';
import 'package:r_store/utils/constants/sizes.dart';

class RFormDivider extends StatelessWidget {
  const RFormDivider({super.key, required this.dividerText});
  final String dividerText;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: Theme.of(context).dividerColor,
            indent: RSizes.defaultSpace,
            endIndent: 5,
          ),
        ),
        Text(dividerText, style: Theme.of(context).textTheme.bodySmall),
        Expanded(
          child: Divider(
            color: Theme.of(context).dividerColor,
            indent: 5,
            endIndent: RSizes.defaultSpace,
          ),
        ),
      ],
    );
  }
}
