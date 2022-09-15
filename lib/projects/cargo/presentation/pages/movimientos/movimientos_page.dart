import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solgis/projects/cargo/domain/providers/movimientos_page_provider.dart';
import 'package:solgis/projects/cargo/presentation/pages/movimientos/movimiento_dia_tab.dart';
import 'package:solgis/projects/cargo/presentation/pages/movimientos/widgets/custom_navigation_bar.dart';
import 'package:solgis/projects/cargo/theme/theme_cargo.dart';

class MovimientosPageCargo extends StatelessWidget {
  const MovimientosPageCargo({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppThemeCargo.lighThemeCargo.primaryColor,
        title: const Text('MOVIMIENTOS'),
        centerTitle: true,
      ),

      bottomNavigationBar: const CustomNavigationBar(),
      body: const _MovimientosPageCargoBody(),
    );

  }

}

class _MovimientosPageCargoBody extends StatelessWidget {

  const _MovimientosPageCargoBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final uiProvider = Provider.of<MovimientosPageProvider>(context);
    final currentIndex = uiProvider.getSelectedMenuOpt;

    switch ( currentIndex ){

      case 0:
        return  MovimientoPlantaTab(index: currentIndex);
      case 1:
        // return  MovimientoPlantaTab(index: currentIndex);
      default:
        return  MovimientoPlantaTab(index: currentIndex);

    }

  }
}