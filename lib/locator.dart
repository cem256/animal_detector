import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';

import 'core/services/image_picker_service.dart';
import 'core/services/tensor_flow_service.dart';
import 'core/theme/app_theme.dart';
import 'features/detect_animal/logic/detect_animal_bloc.dart';

// Global service locator
final getIt = GetIt.instance;

void initServices() {
  // Features - Detect Animal
  // Bloc
  getIt.registerFactory(
    () => DetectAnimalBloc(
      imagePickerService: getIt(),
      tensorFlowService: getIt(),
    ),
  );
  // Services
  getIt.registerLazySingleton<ImagePickerService>(
    () => ImagePickerServiceImp(
      imagePicker: getIt(),
    ),
  );
  getIt.registerLazySingleton<TensorFlowService>(
    () => TensorFlowServiceImp(),
  );
  // Image Picker
  getIt.registerLazySingleton(
    () => ImagePicker(),
  );
  // Theme
  getIt.registerLazySingleton(
    () => AppTheme(),
  );
}
