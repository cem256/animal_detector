import 'package:flutter/material.dart';

import '../../../../../core/extensions/context_extensions.dart';

class DefaultContainer extends StatelessWidget {
  const DefaultContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: context.paddingAllDefault,
      decoration: BoxDecoration(
        borderRadius: context.defaultBorderRadius,
        color: context.theme.cardColor,
      ),
      child: child,
    );
  }
}
