// ignore_for_file: prefer_const_constructors, file_names, avoid_unnecessary_containers, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';

import 'customtext.dart'; 

  ButtonStyle b1 = ButtonStyle( 
      side: MaterialStateProperty.all(BorderSide(width: .5)),
      shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      padding: MaterialStateProperty.all(EdgeInsets.all(18)),
      backgroundColor: MaterialStateProperty.all(Colors.orange));
class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onpresed;
  CustomButton(this.text, this.onpresed);

  @override
  Widget build(BuildContext context) {
    return Container( 
      child: ElevatedButton(
          style: b1,
          onPressed: onpresed,
          child: CustomText(
            text,
            16,
            Colors.white,
            alignment: Alignment.center,
          )),
    );
  }
}
