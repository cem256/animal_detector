import 'core/theme/app_theme.dart';
import 'locator.dart';
import 'package:flutter/material.dart';

import 'core/constants/strings.dart';
import 'features/detect_animal/presentation/view/detect_animal_view.dart';

void main() {
  initServices();
  runApp(const AnimalDetector());
}

class AnimalDetector extends StatelessWidget {
  const AnimalDetector({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Strings.appName,
      theme: getIt<AppTheme>().appTheme,
      home: const DetectAnimalView(),
    );
  }
}
