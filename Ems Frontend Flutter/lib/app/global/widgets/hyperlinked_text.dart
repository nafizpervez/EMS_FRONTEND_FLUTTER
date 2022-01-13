import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'on_hover.dart';

class HyperlinkedText extends StatelessWidget {
  final String text;
  final String page;
  final dynamic arguments;
  const HyperlinkedText({
    Key? key,
    required this.text,
    required this.page,
    this.arguments,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: OnHover(
        transY: 0,
        transX: 5.0,
        builder: (isHovered) {
          return GestureDetector(
            onTap: () => Get.toNamed(
              page,
              arguments: arguments,
            ),
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.blue,
              ),
            ),
          );
        },
      ),
    );
  }
}
