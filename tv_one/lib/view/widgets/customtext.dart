// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  String text = "";
  double fontSize = 16;
  Color color = Colors.black;
  Alignment alignment;
  int? lines;
  final double hieght;
  final String fontFamly;
  final FontWeight fontWeight;
  final TextOverflow overflow;

  CustomText(this.text, this.fontSize, this.color,
      {this.alignment = Alignment.topLeft,
      this.lines,
      this.hieght = 1,
      this.fontFamly = 'avenir',
      this.fontWeight = FontWeight.normal,
      this.overflow = TextOverflow.visible});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
        text,
        //overflow: TextOverflow.fade,
        style: TextStyle(
            color: color,
            fontSize: fontSize,
            height: hieght,
            fontFamily: fontFamly,
            fontWeight: fontWeight),
        overflow: overflow,
        maxLines: lines,
      ),
    );
  }
}
