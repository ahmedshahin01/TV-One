import 'package:flutter/material.dart';
import 'package:tv_one/uitil/constants.dart';

class Responsive extends StatelessWidget {
  final Widget? webWidget;
  final Widget? TabletWidget;
  final Widget MobileWidget;

  const Responsive({
    this.webWidget,
    this.TabletWidget,
    required this.MobileWidget,
  });

  @override
  Widget build(BuildContext context) {
    
  Size size =MediaQuery.of(context).size;
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
       /* if (size.width <= KmobileWidth) {
          print(size.width);
          print('mobile');
          return MobileWidget;
        } else if (size.width <= KtabletWidth) {
          print(size.width);
          print('tablet');
          return TabletWidget ?? MobileWidget;
        } else {
          print(size.width);
          print('website');
          return webWidget ?? MobileWidget;
        }*/

        if (size.width >= KwebWidth) {
          print(KwebWidth);
          print('website');
          
          print('1111111111111111111111111111111111111111111111');
          return webWidget ?? MobileWidget;
        } else if (size.width >= KtabletWidth) {
           print('2222222222222222222222');
          print(size.width);
           print('tablet');
          return TabletWidget ?? MobileWidget;
        } else {
          print(KmobileWidth);
          print('mobile');
          return MobileWidget;
        }
      },
    );
  }
}
