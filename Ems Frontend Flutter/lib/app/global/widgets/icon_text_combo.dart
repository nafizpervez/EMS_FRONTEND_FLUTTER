import 'package:flutter/material.dart';

class IconTextCombo extends StatelessWidget {
  final IconData? icon;
  final String title;
  final String data;

  const IconTextCombo({
    Key? key,
    this.icon,
    required this.data,
    this.title = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5.0,
      ),
      child: SelectableText.rich(
        TextSpan(
          children: <TextSpan>[
            title != ''
                ? TextSpan(
                    text: title + ': ',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : const TextSpan(
                    text: '',
                  ),
            TextSpan(text: data),
          ],
        ),
        textAlign: TextAlign.left,
      ),
    );
  }
}

class IconTextComboUnSelectable extends StatelessWidget {
  final IconData? icon;
  final String title;
  final String data;

  const IconTextComboUnSelectable({
    Key? key,
    this.icon,
    required this.data,
    this.title = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5.0,
      ),
      child: RichText(
        textAlign: TextAlign.left,
        text: TextSpan(
          children: <TextSpan>[
            title != ''
                ? TextSpan(
                    text: title + ': ',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : const TextSpan(
                    text: '',
                  ),
            TextSpan(text: data),
          ],
        ),
      ),
    );
  }
}
