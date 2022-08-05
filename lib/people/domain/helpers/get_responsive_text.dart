import 'package:flutter/material.dart';

const sizeReference = 859.0;

// double getResponsiveText(BuildContext context, double size)=>size * sizeReference / MediaQuery.of(context).size.longestSide;

double getResponsiveText(Size size, double sizefont){

  return ((size.height/sizeReference) * sizefont).roundToDouble();

}