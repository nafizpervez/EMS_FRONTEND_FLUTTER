import 'package:adnems/app/core/utils/constants/responsive_breakpoints.dart';
import 'package:flutter/material.dart';

class ResponsiveUI extends StatelessWidget {
  final Widget? phoneS;
  final Widget? phoneL;
  final Widget? tablet;
  final Widget desktop;
  const ResponsiveUI({
    Key? key,
    this.phoneS,
    this.phoneL,
    this.tablet,
    required this.desktop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (MediaQuery.of(context).size.width <
            ResponsivebBreakPoints.PHONE_S) {
          return phoneL ?? phoneL ?? tablet ?? desktop;
        } else if (MediaQuery.of(context).size.width <
            ResponsivebBreakPoints.PHONE_L) {
          return phoneL ?? tablet ?? desktop;
        } else if (MediaQuery.of(context).size.width <
            ResponsivebBreakPoints.TABLET) {
          return tablet ?? desktop;
        } else if (MediaQuery.of(context).size.width <
            ResponsivebBreakPoints.DESKTOP) {
          return desktop;
        } else {
          return desktop;
        }
      },
    );
  }
}
