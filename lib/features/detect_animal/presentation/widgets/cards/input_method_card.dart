import 'package:flutter/material.dart';

import '../../../../../core/extensions/context_extensions.dart';
import '../containers/default_container.dart';

class InputMethodCard extends StatelessWidget {
  const InputMethodCard({super.key, required this.onTap, required this.imagePath, required this.cardText});

  final void Function()? onTap;
  final String imagePath;
  final String cardText;

  @override
  Widget build(BuildContext context) {
    return DefaultContainer(
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            Expanded(
              child: Image.asset(
                imagePath,
              ),
            ),
            SizedBox(
              height: context.mediumValue,
            ),
            Text(
              cardText,
            ),
          ],
        ),
      ),
    );
  }
}
