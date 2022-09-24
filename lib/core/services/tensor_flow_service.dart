import 'dart:io';

import 'package:tflite/tflite.dart';

import '../constants/assets.dart';

abstract class TensorFlowService {
  Future<String?> loadModel();
  Future<List<dynamic>?> runModelOnImage(File image);
}

class TensorFlowServiceImp implements TensorFlowService {
  @override
  Future<String?> loadModel() async {
    String? model = await Tflite.loadModel(
      model: Assets.animalMlModel,
      labels: Assets.animalMlModelLabels,
    );
    return model;
  }

  @override
  Future<List?> runModelOnImage(File image) async {
    var prediction = Tflite.runModelOnImage(
      path: image.path,
      imageMean: 127.5,
      imageStd: 127.5,
      numResults: 2,
    );
    return prediction;
  }
}
