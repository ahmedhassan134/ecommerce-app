import 'package:flutter/material.dart';

import '../../../../core/utils/sizeconfig.dart';
class CustomContainer extends StatelessWidget {
   CustomContainer({super.key,required this.width,required this.child});

  final double width;
  Widget child;
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return    Container(
      alignment: .center,
      padding: EdgeInsets.all(SizeConfig.screenWidth*.02),
      width:width,
      // height:SizeConfig.screenHeight *.05 ,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(SizeConfig.screenHeight*.01),
          color: Colors.black.withAlpha(60)
      ),
      child: child,

    );
  }
}
