import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/constants/strings.dart';
import 'core/theme/app_theme.dart';
import 'features/detect_animal/presentation/view/detect_animal_view.dart';
import 'locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initServices();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
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
