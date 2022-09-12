import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:im_stepper/stepper.dart';
import 'package:provider/provider.dart';
import 'package:solgis/projects/cargo/domain/providers/ingreso_autorizado_provider.dart';
import 'package:solgis/projects/cargo/presentation/pages/ingresos/ingresos_pages.dart';
import 'package:solgis/projects/cargo/presentation/pages/ingresos/widgets/widgets.dart';

class IngresoAutorizadoCargoPage extends StatelessWidget {

  const IngresoAutorizadoCargoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create:(_) => IngresoAutorizadoProvider())
      ],
    child: const IngresoAutorizadoCargoPageState(),
    
    );

  }
}

class IngresoAutorizadoCargoPageState extends StatelessWidget {

  const IngresoAutorizadoCargoPageState({super.key});

  @override
  Widget build(BuildContext context) {
      return IngresoCargoPage(
      titleIngreso: 'INGRESO AUTORIZADO',
      colorAppBar: Colors.green,
      registrarFunction: (){},
      body: const _IngresoAutorizadoBody(),
    ); 
  }
}


class _IngresoAutorizadoBody extends StatelessWidget {

  const _IngresoAutorizadoBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final ingresoProvider = Provider.of<IngresoAutorizadoProvider>(context);


    return Column(

      children: [
        IconStepper(

          enableNextPreviousButtons: false,
          icons: const [
            Icon(FontAwesomeIcons.car),
            Icon(FontAwesomeIcons.person),
            Icon(FontAwesomeIcons.photoFilm),
            // Icon(FontAwesomeIcons.photoFilm),
          ],
          activeStep: ingresoProvider.indexStep ,
          onStepReached: (index)=>ingresoProvider.indexStep = index,
        ),
        const SelectedWidget(),
      ],
    );

  }

  List<Step> getSteps(BuildContext context ){

    final ingresoProvider = Provider.of<IngresoAutorizadoProvider>(context, listen: false);

    return [

      Step(
        // state: ingresoProvider.getValorStep>0 ? StepState.complete : StepState.indexed ,
        // isActive: personalProvider.getValorStep>=0,
        title: const FaIcon(FontAwesomeIcons.car), 
        content: Container(),
      ),

      Step(
        // isActive: personalProvider.getValorStep>=1,
        title: const FaIcon(FontAwesomeIcons.person),
        content: Container(),
      ),

      // Step(
      //   // isActive: personalProvider.getValorStep>=1,
      //   title: const FaIcon(FontAwesomeIcons.dev), 
      //   content: Container(),
      // ),

      // Step(
      //   // isActive: personalProvider.getValorStep>=1,
      //   title: const FaIcon(FontAwesomeIcons.photoFilm), 
      //   content: Container(),
      // ),

    ];

  }

}

class SelectedWidget extends StatelessWidget {

  const SelectedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final ingresoProvider = Provider.of<IngresoAutorizadoProvider>(context);

    switch (ingresoProvider.indexStep) {
      case 0:
        return const VehiculoIngresoWidget();

      case 1:
        return const Text('1');

      case 2:
        return const Text('2');

      default:
        return const Text('3');
    }

  }
}
