part of 'detect_animal_bloc.dart';

@freezed
class DetectAnimalEvent with _$DetectAnimalEvent {
  const factory DetectAnimalEvent.modelLoaded() = ModelLoaded;
  const factory DetectAnimalEvent.selectFromGalleryPressed() = SelectFromGalleryPressed;
  const factory DetectAnimalEvent.takePhotoPressed() = TakePhotoPressed;
}
