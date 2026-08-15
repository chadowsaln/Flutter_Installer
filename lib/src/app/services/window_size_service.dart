import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:window_manager/window_manager.dart';

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}

@injectable
class WindowSizeService {
  static const double width = 1200;
  static const double height = 720;

  Future<void> _setWindowSize() async {
    final Rect bounds = await windowManager.getBounds();

    final Rect frame = Rect.fromCenter(
      center: Offset(
        bounds.center.dx,
        bounds.center.dy,
      ),
      width: width,
      height: height,
    );

    await windowManager.setBounds(frame);

    await setWindowTitle(
      'Flutter Installer for ${Platform.operatingSystem.capitalize()}',
    );

    if (Platform.isMacOS) {
      await windowManager.setMinimumSize(Size(width, height));
      await windowManager.setMaximumSize(Size(width * 2, height * 2));
    }
  }

  Future<void> initialize() async {
    await windowManager.ensureInitialized();

    final Size currentSize = await windowManager.getSize();

    if (currentSize != const Size(width, height)) {
      await _setWindowSize();
    }
  }

  Future<void> setWindowTitle(String title) {
    return windowManager.setTitle(title);
  }
}
