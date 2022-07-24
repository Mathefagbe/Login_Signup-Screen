import 'package:brancher_chatapp/view/constant/fonts/fonts.dart';
import 'package:brancher_chatapp/view/widget/customclip.dart';
import 'package:brancher_chatapp/view/widget/paints.dart';
import 'package:flutter/material.dart';

class DesignContainer extends StatelessWidget {
  DesignContainer({Key? key}) : super(key: key);
  Font _font = Font();

  @override
  Widget build(BuildContext context) {
    var height = _font.height(context);
    var textfont = _font.textfont(context);
    var width = _font.width(context);
    return Stack(children: [
      ClipPath(
        clipper: CustomClips(),
        child: Container(
          height: height * 0.25,
          width: double.maxFinite,
          //color: Color.fromARGB(255, 243, 33, 194),
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [Colors.purple, Colors.red]),
          ),
        ),
      ),
      Container(
        height: height * 0.25,
        width: double.maxFinite,
        child: CustomPaint(
          painter: Paints(),
        ),
      ),
      Container(
        height: height * 0.25,
        width: double.maxFinite,
        child: CustomPaint(
          painter: SmallPaints(),
        ),
      ),
      Container(
        height: height * 0.25,
        width: double.maxFinite,
        child: CustomPaint(
          painter: SmallestPaints(),
        ),
      )
    ]);
  }
}
