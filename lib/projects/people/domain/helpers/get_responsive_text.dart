import 'package:flutter/material.dart';

const sizeReference = 859.0;

double getResponsiveText(Size size, double sizefont){

  return ((size.height/sizeReference) * sizefont).roundToDouble();

}