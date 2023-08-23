import 'package:flutter/material.dart';

class UserItem extends StatelessWidget {
  const UserItem({
    super.key,
    required this.title,
    required this.value,
    this.titleSize = 12,
    this.paddingBetweenTitleAndValue = 0,
    this.valueSize = 16,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    this.margin = const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    this.icon,
  });

  final String title;
  final String value;

  final double titleSize;
  final double valueSize;
  final double paddingBetweenTitleAndValue;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      width: double.infinity,
      child: Row(
        children: [
          if (icon != null) ...[
            Icon(
              icon,
              size: 24,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
            const SizedBox(width: 24),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                    fontSize: titleSize,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: paddingBetweenTitleAndValue),
                Text(
                  value,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                    fontSize: valueSize,
                    fontWeight: FontWeight.w400,
                  ),
                  overflow: TextOverflow.clip,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
