import 'package:flutter/material.dart';
import 'package:r_store/common/widgets/custome_shapes/containers/circular_container.dart';
import 'package:r_store/utils/constants/colors.dart';
import 'package:r_store/utils/helpers/helper_functions.dart';

class RChoiceChip extends StatelessWidget {
  const RChoiceChip({
    super.key,
    required this.label,
    required this.isSelected,
    this.onSelected,
  });
  final String label;
  final bool isSelected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final bool isColor = RHelperFunctions.getColor(label) != null;
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Colors.transparent,
      ),
      child: ChoiceChip(
        label: isColor ? SizedBox() : Text(label),
        selected: isSelected,
        shape: isColor ? CircleBorder() : null,
        onSelected: (value) {
          if (onSelected != null) {
            onSelected!(value);
          }
        },
        labelStyle: TextStyle(color: isSelected ? RColors.white : null),
        avatar: isColor? RCircularContainer(
          width: 50,
          height: 50,
          color: RHelperFunctions.getColor(label) ?? Colors.transparent,
        ) : null,
        padding: isColor? EdgeInsets.all(0):null,
        labelPadding: isColor? EdgeInsets.all(0):null,
        disabledColor: Colors.transparent,
        backgroundColor: isColor ? RHelperFunctions.getColor(label) : null,
        selectedColor: isColor
            ? RHelperFunctions.getColor(label)
            : RColors.primary,
        
      ),
    );
  }
}
