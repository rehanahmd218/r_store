import 'package:flutter/material.dart';
import 'package:r_store/common/widgets/custome_shapes/containers/circular_container.dart';
import 'package:r_store/common/widgets/custome_shapes/curved_edges/curved_edge_widget.dart';
import 'package:r_store/utils/constants/colors.dart';

class RPrimaryHeaderContainer extends StatelessWidget {
  const RPrimaryHeaderContainer({super.key, required this.child});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return RCurvedEdgeWidget(
      child: Container(
        color: RColors.primary,
        padding: EdgeInsets.all(0),
        // height: 400,
        child: Stack(
          children: [
            Positioned(
              top: -150,
              right: -250,
              child: RCircularContainer(
                color: RColors.textWhite.withValues(alpha: 0.1),
              ),
            ),
            Positioned(
              top: 100,
              right: -300,
              child: RCircularContainer(
                color: RColors.textWhite.withValues(alpha: 0.1),
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
