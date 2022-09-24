import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/services/image_picker_service.dart';
import '../../../../core/services/tensor_flow_service.dart';

part 'detect_animal_bloc.freezed.dart';
part 'detect_animal_event.dart';
part 'detect_animal_state.dart';

class DetectAnimalBloc extends Bloc<DetectAnimalEvent, DetectAnimalState> {
  final ImagePickerService imagePickerService;
  final TensorFlowService tensorFlowService;

  DetectAnimalBloc({required this.imagePickerService, required this.tensorFlowService})
      : super(const DetectAnimalState()) {
    on<ModelLoaded>(_onModelLoaded);
    on<SelectFromGalleryPressed>(_onSelectFromGalleryPressed);
    on<TakePhotoPressed>(_onTakePhotoPressed);
  }

  Future<void> _onModelLoaded(ModelLoaded event, Emitter<DetectAnimalState> emit) async {
    await tensorFlowService.loadModel();
  }

  Future<void> _onSelectFromGalleryPressed(SelectFromGalleryPressed event, Emitter<DetectAnimalState> emit) async {
    File? image = await imagePickerService.selectFromGallery();
    if (image != null) {
      List? predictions = await tensorFlowService.runModelOnImage(image);
      emit(state.copyWith(predictions: predictions, image: image));
    }
  }

  Future<void> _onTakePhotoPressed(TakePhotoPressed event, Emitter<DetectAnimalState> emit) async {
    File? image = await imagePickerService.takePhoto();
    if (image != null) {
      List? predictions = await tensorFlowService.runModelOnImage(image);
      emit(state.copyWith(predictions: predictions, image: image));
    }
  }
}
