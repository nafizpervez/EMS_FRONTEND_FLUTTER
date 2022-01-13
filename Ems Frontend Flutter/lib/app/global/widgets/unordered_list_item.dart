import 'package:adnems/app/core/utils/constants/colors.dart';
import 'package:flutter/material.dart';

import 'on_hover.dart';

class UnOrderedListItem extends StatelessWidget {
  final String text;
  final IconData icon;
  final double size;
  final Color color;
  final double width;
  const UnOrderedListItem({
    Key? key,
    required this.text,
    this.icon = Icons.circle,
    this.size = 15.0,
    this.color = ADNColorConstants.kADNBlack,
    this.width = 300.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OnHover(
      transX: 8.0,
      transY: 0.0,
      builder: (isHovered) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 5.0,
                ),
                child: Icon(
                  icon,
                  size: size - 3,
                  color: color.withOpacity(0.5),
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Text(
                  text,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: color,
                    fontSize: size,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
