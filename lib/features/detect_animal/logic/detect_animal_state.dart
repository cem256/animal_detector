part of 'detect_animal_bloc.dart';

@freezed
class DetectAnimalState with _$DetectAnimalState {
  const factory DetectAnimalState({
    @Default([]) List? predictions,
    File? image,
  }) = _DetectAnimalState;
}
