import 'package:flutter/material.dart';
import 'package:r_store/utils/constants/colors.dart';

class RSettingMenuTile extends StatelessWidget {
  const RSettingMenuTile({super.key, required this.leadingIcon, required this.subtitle, required this.title, this.trailing,this.onTap});

  final String title;
  final String subtitle;
  final Widget? trailing;
  final IconData leadingIcon;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        title: Text(title,style: Theme.of(context).textTheme.bodyMedium,),
        subtitle: Text(subtitle,style: Theme.of(context).textTheme.titleSmall,),
        trailing: trailing,
        leading: Icon(leadingIcon,color: RColors.primary,),
      ),
    );
  }
}