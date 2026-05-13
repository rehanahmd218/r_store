import 'package:flutter/material.dart';
import 'package:r_store/common/widgets/custome_shapes/curved_edges/curved_shape_clipper.dart';

class RCurvedEdgeWidget extends StatelessWidget {
  const RCurvedEdgeWidget({super.key, this.child});

  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return ClipPath(clipper: RCurvedShapeClipper(), child: child);
  }
}
