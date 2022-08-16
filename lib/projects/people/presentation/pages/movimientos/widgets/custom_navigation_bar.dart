import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:solgis/projects/people/domain/providers/movimientos_page_provider.dart';

class CustomNavigationBar extends StatelessWidget {

  const CustomNavigationBar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final uiProvider = Provider.of<MovimientosPageProvider>(context);
    final currentIndex = uiProvider.getSelectedMenuOpt; 

    return BottomNavigationBar(

      backgroundColor: Colors.orange,
      fixedColor: Colors.white,
      iconSize: 30,
      currentIndex: currentIndex,
      onTap: (int index)=> uiProvider.setSelectedMenuOpt = index,

      items: const <BottomNavigationBarItem>[

        BottomNavigationBarItem(

          icon: FaIcon(FontAwesomeIcons.house),
          label: 'DENTRO DE LA PLANTA'

        ),

        BottomNavigationBarItem(

          icon: FaIcon(FontAwesomeIcons.readme),
          label: 'MOVIMIENTOS DEL DIA'

        ),

      ]

    );


  }
  
}