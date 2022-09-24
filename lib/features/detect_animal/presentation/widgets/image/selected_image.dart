import 'dart:io';

import '../../../../../core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class SelectedImage extends StatelessWidget {
  const SelectedImage({super.key, required this.image});

  final File? image;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: context.defaultBorderRadius,
      child: Image.file(
        fit: BoxFit.cover,
        image!,
      ),
    );
  }
}
