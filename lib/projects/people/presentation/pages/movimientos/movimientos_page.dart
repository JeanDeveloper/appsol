import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solgis/projects/people/domain/providers/movimientos_page_provider.dart';
import 'package:solgis/projects/people/domain/utils/get_app_bar.dart';
import 'package:solgis/projects/people/domain/utils/search_delegate.dart';
import 'package:solgis/projects/people/presentation/pages/movimientos/movimientos_dia_tab_page.dart';
import 'package:solgis/projects/people/presentation/pages/movimientos/movimientos_planta_tab_page.dart';
import 'package:solgis/projects/people/presentation/pages/movimientos/widgets/custom_navigation_bar.dart';


class MovimientosPage extends StatelessWidget {

  const MovimientosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: appBarNoSearching(context, 'MOVIMIENTOS', ()=>showSearch(context: context, delegate: SearchDelegateProvider())),
      bottomNavigationBar: const CustomNavigationBar(),
      body: const _MovimientosPageBody(),
    );
  }

}

class _MovimientosPageBody extends StatelessWidget {

  const _MovimientosPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final uiProvider = Provider.of<MovimientosPageProvider>(context);
    final currentIndex = uiProvider.getSelectedMenuOpt; 

    switch (currentIndex) {

      case 0:
        return MovimientosPlantasTabPage(index: currentIndex);

      case 1:
        return MovimientosDiaTabPage(index: currentIndex);

      default:
        return MovimientosPlantasTabPage(index: currentIndex);

    }
    
  }

}