import 'package:devtest/core/core.dart';
import 'package:flutter/material.dart';


class LoadingOverlay {
  static void show({int? progress, int? insertedLines, int? totalLines}) {
    showDialog(
      context: navigatorKey.currentContext!,
      barrierDismissible: false,
      builder: (context) => WillPopScope(
        onWillPop: () async => false,
        child: CustomLoading(
          progress: progress,
          isOverlay: true,
        ),
      ),
    );
  }

  static void hide() {
    if (ModalRoute.of(navigatorKey.currentContext!)?.isCurrent != true) {
      Navigator.of(navigatorKey.currentContext!).pop();
    }
  }
}
