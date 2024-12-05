import 'package:flutter/material.dart';

import '../../../../../../core/utils/my_colors.dart';

class LoadingProgress extends StatelessWidget {
  const LoadingProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: primaryColor,
      ),
    );
  }
}
