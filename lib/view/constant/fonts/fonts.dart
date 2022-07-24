import 'dart:math';

import 'package:flutter/cupertino.dart';

class Font {
  double width(BuildContext context) {
    debugPrint(MediaQuery.of(context).size.width.toString());
    return MediaQuery.of(context).size.width;
  }

  double height(BuildContext context) {
    debugPrint("height" + MediaQuery.of(context).size.height.toString());
    return MediaQuery.of(context).size.height;
  }

  double textfont(BuildContext context) {
    double font = max(
        MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);
    return font;
  }
}
