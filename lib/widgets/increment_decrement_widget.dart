import 'package:cryptocurrency_flutter/utils/app_colors.dart';
import 'package:flutter/material.dart';

class IncrementDecrementWidget extends StatelessWidget {
  final bool isDecrease;
  final int? size;

  IncrementDecrementWidget({this.isDecrease = false, this.size});

  @override
  Widget build(BuildContext context) {
    return isDecrease
        ? Image.asset(
            'images/chart_images/decrement_arrow.png',
            scale: 5,
            color: dangerColor,
          )
        : Image.asset(
            'images/chart_images/increment_arrow.png',
            scale: 5,
            color: successColor,
          );
  }
}
