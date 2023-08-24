import 'package:flutter/material.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({
    super.key,
    this.progress,
    this.isOverlay = false,
  });

  final int? progress;
  final bool isOverlay;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(24.0),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(10),
          boxShadow: isOverlay
              ? null
              : [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 0,
                    blurRadius: 20,
                    offset: const Offset(0, 0),
                  ),
                ],
        ),
        child: IntrinsicHeight(
          child: Material(
            color: Colors.transparent,
            child: CircularProgressIndicator(
              value: progress == null ? null : progress! / 100,
            ),
          ),
        ),
      ),
    );
  }
}
