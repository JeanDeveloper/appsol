import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:solgis/projects/cargo/domain/providers/movimientos_page_provider.dart';

class CustomNavigationBar extends StatelessWidget {

  const CustomNavigationBar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final uiProvider = Provider.of<MovimientosCargoPageProvider>(context);
    final currentIndex = uiProvider.getSelectedMenuOpt; 

    return BottomNavigationBar(

      backgroundColor: Colors.orange,
      fixedColor: Colors.white,
      currentIndex: currentIndex,
      onTap: (int index)=> uiProvider.setSelectedMenuOpt = index,

      items: const <BottomNavigationBarItem>[

        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.house),
          label: 'DENTRO DE LA PLANTA',
          tooltip: 'Aqui se muestran los movimientos de vehiculos que se encuentran dentro de la planta',
        ),

        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.readme),
          label: 'MOVIMIENTOS DEL DIA',
          tooltip: 'Aqui se muestran los movimientos de los vehiculos de todo el dia.' 

        ),

      ]

    );

  }

}