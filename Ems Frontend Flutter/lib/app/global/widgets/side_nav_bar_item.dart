import 'package:adnems/app/core/utils/constants/colors.dart';
import 'package:adnems/app/global/widgets/on_hover.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SideNavItem extends StatelessWidget {
  final String name;
  final IconData icon;
  final String route;
  final dynamic agrguments;
  const SideNavItem({
    Key? key,
    required this.name,
    required this.icon,
    required this.route,
    this.agrguments,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (route != '') {
          Get.toNamed(
            route,
            arguments: agrguments,
          );
        }
      },
      child: OnHover(
          transY: 0,
          transX: 5.0,
          builder: (isHovered) {
            return MouseRegion(
              cursor: SystemMouseCursors.click,
              child: AnimatedContainer(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                duration: const Duration(milliseconds: 150),
                color: isHovered
                    ? ADNColorConstants.kADNBlack
                    : Colors.transparent,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      icon,
                      color: isHovered
                          ? Colors.greenAccent
                          : ADNColorConstants.kADNWhite,
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      name,
                      style: TextStyle(
                        color: isHovered
                            ? Colors.greenAccent
                            : ADNColorConstants.kADNWhite,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
