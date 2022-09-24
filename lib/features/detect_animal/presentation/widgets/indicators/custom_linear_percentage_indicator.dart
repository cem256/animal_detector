import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../../../core/extensions/context_extensions.dart';

class CustomLinearPercentageIndicator extends StatelessWidget {
  const CustomLinearPercentageIndicator({super.key, required this.predictions});

  final List? predictions;

  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
      animation: true,
      animationDuration: 1000,
      animateFromLastPercent: true,
      leading: Text(predictions?[0]['label']),
      padding: context.paddingLeftDefault,
      lineHeight: context.dynamicHeight(0.03),
      percent: predictions?[0]['confidence'],
      center: Text("${(predictions?[0]['confidence'] * 100).toStringAsFixed(2)}%"),
      progressColor: context.theme.focusColor,
      backgroundColor: context.theme.scaffoldBackgroundColor,
      barRadius: context.defaultRadius,
    );
  }
}
