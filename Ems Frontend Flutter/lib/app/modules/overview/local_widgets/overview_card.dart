import 'dart:ui';

import 'package:adnems/app/core/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class OverviewCard extends StatelessWidget {
  final String title;
  final int flex;
  final Widget child;

  const OverviewCard({
    Key? key,
    required this.title,
    required this.child,
    this.flex = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollController _sC = ScrollController(debugLabel: 'ovSec');
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        elevation: 3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: const BoxDecoration(
                  color: ADNColorConstants.kADNLightGreen,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      ADNColorConstants.kADNGreen,
                      ADNColorConstants.kADNLightGreen,
                    ],
                  )),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: ADNColorConstants.kADNWhite,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
