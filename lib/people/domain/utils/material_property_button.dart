import 'package:flutter/material.dart';
import 'package:solgis/theme/theme_people.dart';

class ButtonBackGroundColor extends MaterialStateProperty<Color?>{
  
  ButtonBackGroundColor(context);

  @override
  Color? resolve(Set<MaterialState> states) {

    if(states.contains(MaterialState.pressed)) {
      return Colors.white;
    }

    return AppThemePeople.lighThemePeople.backgroundColor;
    
  }

}