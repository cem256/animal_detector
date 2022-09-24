import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/strings.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/gen/assets.gen.dart';
import '../../../../locator.dart';
import '../../logic/detect_animal_bloc.dart';
import '../widgets/cards/input_method_card.dart';
import '../widgets/containers/default_container.dart';
import '../widgets/image/selected_image.dart';
import '../widgets/indicators/custom_linear_percentage_indicator.dart';

class DetectAnimalView extends StatelessWidget {
  const DetectAnimalView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.appName),
      ),
      body: BlocProvider(
        create: (_) => getIt<DetectAnimalBloc>()..add(const ModelLoaded()),
        child: const HomeViewBody(),
      ),
    );
  }
}

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingAllDefault,
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: DefaultContainer(
              child: BlocBuilder<DetectAnimalBloc, DetectAnimalState>(
                builder: (context, state) {
                  if (state.predictions?.isEmpty ?? true) {
                    return const Center(
                      child: Text(
                        "Please select select an image",
                      ),
                    );
                  } else {
                    return Column(
                      children: [
                        Expanded(
                          flex: 9,
                          child: SelectedImage(
                            image: state.image,
                          ),
                        ),
                        SizedBox(
                          height: context.mediumValue,
                        ),
                        Expanded(
                          child: CustomLinearPercentageIndicator(
                            predictions: state.predictions,
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),
            ),
          ),
          SizedBox(
            height: context.mediumValue,
          ),
          Expanded(
            child: InputMethodCard(
              onTap: () => context.read<DetectAnimalBloc>().add(const TakePhotoPressed()),
              imagePath: Assets.icons.icCamera.path,
              cardText: "Take a Photo",
            ),
          ),
          SizedBox(
            height: context.mediumValue,
          ),
          Expanded(
            child: InputMethodCard(
              onTap: () => context.read<DetectAnimalBloc>().add(const SelectFromGalleryPressed()),
              imagePath: Assets.icons.icGallery.path,
              cardText: "Select from Gallery",
            ),
          ),
        ],
      ),
    );
  }
}
