import 'package:brancher_chatapp/view/constant/fonts/fonts.dart';
import 'package:flutter/material.dart';

class ResuableButton extends StatelessWidget {
  ResuableButton(
      {required this.ontap,
      required this.text,
      required this.color,
      required this.textcolor,
      required this.bordercolor,
      this.gradient});
  final VoidCallback ontap;
  final String text;
  final Color color;
  final Color textcolor;
  final Color bordercolor;
  final Gradient? gradient;

  final Font _font = Font();

  @override
  Widget build(BuildContext context) {
    var height = _font.height(context);
    var textfont = _font.textfont(context);
    var width = _font.width(context);
    return Align(
      alignment: Alignment.center,
      child: InkWell(
        highlightColor: Colors.blue,
        hoverColor: Colors.blue,
        customBorder:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        onTap: ontap,
        child: Container(
          alignment: Alignment.center,
          height: height * 0.061,
          width: width * 0.333,
          child: Text(
            text,
            style: TextStyle(
                fontSize: textfont * 0.027,
                fontWeight: FontWeight.bold,
                color: textcolor),
          ),
          decoration: BoxDecoration(
              gradient: gradient,
              border: Border.all(color: bordercolor, width: 2),
              color: color,
              borderRadius: BorderRadius.circular(18)),
        ),
      ),
    );
  }
}
