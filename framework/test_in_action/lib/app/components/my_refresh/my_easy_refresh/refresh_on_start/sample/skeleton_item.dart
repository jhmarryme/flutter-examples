import 'package:flutter/material.dart';

/// Skeleton list item.
class SkeletonItem extends StatelessWidget {
  /// Scrollable direction.
  final Axis direction;

  final int? index;

  const SkeletonItem({
    Key? key,
    this.direction = Axis.vertical,
    this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    const backgroundColor = Colors.black12;
    final foregroundColor = themeData.colorScheme.surface;
    if (direction == Axis.vertical) {
      return Card(
        elevation: 0,
        color: backgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 16),
                height: 150,
                width: 80,
                color: foregroundColor,
                child: Text(index == null ? '' : index.toString()),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 8, right: 24),
                      height: 12,
                      width: double.infinity,
                      constraints: const BoxConstraints(
                        maxWidth: 200,
                      ),
                      color: foregroundColor,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 16),
                      height: 12,
                      width: 80,
                      color: foregroundColor,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      height: 12,
                      width: 80,
                      color: foregroundColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
    return Card(
      elevation: 0,
      color: backgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 16),
              height: 80,
              width: 80,
              color: foregroundColor,
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 8, bottom: 24),
                    width: 12,
                    height: double.infinity,
                    constraints: const BoxConstraints(
                      maxHeight: 200,
                    ),
                    color: foregroundColor,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 16),
                    width: 12,
                    height: 80,
                    color: foregroundColor,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 8),
                    width: 12,
                    height: 80,
                    color: foregroundColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
