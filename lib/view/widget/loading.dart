import 'package:flutter/material.dart';

class LoadingOverlay {
  OverlayEntry? _overlay;

  LoadingOverlay();

  void show(BuildContext context) {
    if (_overlay == null) {
      _overlay = OverlayEntry(
        builder: (context) => const ColoredBox(
          color: Color.fromARGB(128, 0, 0, 0),
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
      Overlay.of(context)!.insert(_overlay!);
    }
  }

  void hide() {
    if (_overlay != null) {
      _overlay!.remove();
      _overlay = null;
    }
  }
}
