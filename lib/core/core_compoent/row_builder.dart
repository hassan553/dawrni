/// The RowBuilder class is a custom widget that helps in generating a row of widgets dynamically.
/// It takes an [itemBuilder] function, [itemCount], and optional parameters to customize the layout of the row.

import 'package:flutter/material.dart';

class RowBuilder extends StatelessWidget {
  const RowBuilder({
    Key? key,
    required this.itemBuilder,
    required this.itemCount,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
  }) : super(key: key);

  /// The [itemBuilder] is a callback function that takes the [BuildContext] and [index] as parameters
  /// and returns the widget for the corresponding index.
  final IndexedWidgetBuilder? itemBuilder;

  /// The [mainAxisAlignment] determines how the widgets are positioned along the main axis (horizontal axis) of the row.
  final MainAxisAlignment mainAxisAlignment;

  /// The [mainAxisSize] determines the width of the row. It can be either [MainAxisSize.max] (occupy all available width)
  /// or [MainAxisSize.min] (take only the necessary width).
  final MainAxisSize mainAxisSize;

  /// The [crossAxisAlignment] determines how the widgets are aligned vertically within the row.
  final CrossAxisAlignment crossAxisAlignment;

  /// The [textDirection] specifies the reading order of the row (left-to-right or right-to-left).
  final TextDirection? textDirection;

  /// The [verticalDirection] determines the order in which the widgets are placed vertically in the row.
  final VerticalDirection verticalDirection;

  /// The [itemCount] specifies the number of items in the row.
  final int? itemCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: crossAxisAlignment,
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      /// Generate a list of widgets using the [itemBuilder] function and convert it to a list using [toList()].
      children: List.generate(itemCount!, (index) => itemBuilder!(context, index))
          .toList(),
    );
  }
}