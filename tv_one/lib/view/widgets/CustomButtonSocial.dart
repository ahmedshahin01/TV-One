// ignore_for_file: file_names, unused_import, use_key_in_widget_constructors, must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';

import 'CustomButton.dart';
import 'customtext.dart';

class CustomButtonSocial extends StatelessWidget {
    CustomButtonSocial({ this.text,this.imageAssets,this.onpresed });
  String? text;
  String? imageAssets;

  final VoidCallback? onpresed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
              onPressed: onpresed ,
              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [Image.asset(imageAssets!),
                SizedBox(width: 80),
                CustomText(text!, 17, Colors.black)],
              ),
              style: ButtonStyle(
      side: MaterialStateProperty.all(BorderSide(width: .5)),
      shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      padding: MaterialStateProperty.all(EdgeInsets.all(18)),
      backgroundColor: MaterialStateProperty.all(Colors.white)),
            );
  }
}