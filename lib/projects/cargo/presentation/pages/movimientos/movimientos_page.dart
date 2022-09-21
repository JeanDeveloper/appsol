import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solgis/projects/cargo/domain/providers/movimientos_page_provider.dart';
import 'package:solgis/projects/cargo/domain/utils/search_delegate_cargo.dart';
import 'package:solgis/projects/cargo/presentation/pages/movimientos/movimiento_dia_tab.dart';
import 'package:solgis/projects/cargo/presentation/pages/movimientos/movimiento_planta_tab.dart';
import 'package:solgis/projects/cargo/presentation/pages/movimientos/widgets/custom_navigation_bar.dart';
import 'package:solgis/projects/people/domain/utils/get_app_bar.dart';

class MovimientosPageCargo extends StatelessWidget {
  const MovimientosPageCargo({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: appBarNoSearching(context, 'MOVIMIENTOS', ()=> showSearch(context: context, delegate: SearchDelegateProviderCargo())  ),

      // appBar: AppBar(
      //   backgroundColor: AppThemeCargo.lighThemeCargo.primaryColor,
      //   title: const Text('MOVIMIENTOS'),
      //   centerTitle: true,
      // ),

      bottomNavigationBar: const CustomNavigationBar(),
      body: const _MovimientosPageCargoBody(),

    );

  }

}

class _MovimientosPageCargoBody extends StatelessWidget {
  const _MovimientosPageCargoBody({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final uiProvider = Provider.of<MovimientosCargoPageProvider>(context);
    final currentIndex = uiProvider.getSelectedMenuOpt;

    switch ( currentIndex ){
      case 0:  
        return const MovimientoPlantaTab();
      case 1:  
        return const MovimientoDiaTab();
      default: 
        return const MovimientoDiaTab();
    }

  }

}