import 'package:adnems/app/core/utils/constants/responsive_breakpoints.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class OnHover extends StatefulWidget {
  double transX;
  double transY;
  double transZ;
  final Widget Function(bool isHovered) builder;
  OnHover({
    Key? key,
    required this.builder,
    this.transX = 0.0,
    this.transY = -5.0,
    this.transZ = 0.0,
  }) : super(key: key);
  @override
  _OnHoverState createState() => _OnHoverState();
}

class _OnHoverState extends State<OnHover> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width < ResponsivebBreakPoints.TABLET) {
      widget.transX = 0;
      widget.transY = 0;
      widget.transZ = 0;
    }
    final hovered = Matrix4.identity()
      ..translate(widget.transX, widget.transY, widget.transY);
    final transform = isHovered ? hovered : Matrix4.identity();

    return MouseRegion(
      onEnter: (_) => onEntered(true),
      onExit: (_) => onEntered(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: transform,
        child: widget.builder(isHovered),
      ),
    );
  }

  void onEntered(bool isHovered) {
    setState(() {
      this.isHovered = isHovered;
    });
  }
}
