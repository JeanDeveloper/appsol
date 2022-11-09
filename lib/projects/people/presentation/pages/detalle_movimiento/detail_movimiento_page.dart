import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solgis/core/domain/helpers/get_image.dart';
import 'package:solgis/core/domain/providers/global_provider.dart';
import 'package:solgis/projects/people/data/services/datos_acceso_movimiento_service.dart';
import 'package:solgis/projects/people/domain/models/datos_acceso_salida_model.dart';
import 'package:solgis/projects/people/domain/models/movimiento_model.dart';
import 'package:solgis/projects/people/domain/providers/detalle_movimiento_provider.dart';
import 'package:solgis/projects/people/presentation/pages/detalle_movimiento/widgets/widgets.dart';

class DetailMovimientoPage extends StatelessWidget{
  const DetailMovimientoPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final MovimientoModel movimiento = ModalRoute.of(context)!.settings.arguments  as MovimientoModel; 
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: ((context) => DetalleMovimientoProvider()))],
      child: DetailMovimientoPageState(movimiento: movimiento),
    );
  }

}

class DetailMovimientoPageState extends StatelessWidget {

  final MovimientoModel movimiento;

  const DetailMovimientoPageState({
    Key? key,
    required this.movimiento
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final gProvider = Provider.of<GlobalProvider>(context);
    final datosSalida = DatosAccesoService();

    return FutureBuilder(
      future: datosSalida.getDatosAccesoSalida(gProvider.codServicio, movimiento.dni!),

      builder: (context, AsyncSnapshot<DatosAccesoSalidaModel?>snapshot) {

        if(!snapshot.hasData) return const Center(child: CircularProgressIndicator());

        final datosSalida = snapshot.data;

        return Scaffold(

          body: Stack(

            children: [

              SingleChildScrollView(
                child: Column(
                  children: [
                    //HEADER
                    Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xff213A89),
                            Color(0xff284393),
                            Color(0xff5267AE),
                          ]
                        ),
                      ),

                      child: SizedBox(
                        width: double.infinity,
                        height: size.height* .45,
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
      
                              FutureBuilder(
              
                                future: getImage(movimiento.pathImage),
                                builder: (context, AsyncSnapshot<Widget> snapshot) {
              
                                  if(!snapshot.hasData){
              
                                    return Container(
                                      width: size.width*0.45,
                                      height: size.height*0.2,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.transparent
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(500),
                                        child: const Image(
                                          fit: BoxFit.cover,
                                          image: AssetImage('assets/gifs/loader-gris.gif'),
                                        ),
                                      )
                                    );
              
                                  }
              
                                  return Container(
                                    width: size.width*0.45,
                                    height: size.height*0.2,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.transparent
                                    ),
                                    // child: Text('nassa'),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(500),
                                      child: snapshot.data,
                                    ),
                                  );
                                }
              
                              ),
      
                              const SizedBox(height:10),
                              Text(
                                movimiento.nombres != '' 
                                  ? movimiento.nombres!.split(' ')
                                    .map((nombre) {
                                      if (nombre == '') return null;
                                      return nombre[0] + nombre.substring(1).toLowerCase();
                                    })
                                    .join(' ')
                                  :'', 
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height:10),
      
                              const SizedBox(height:10),
                              Text(
                                movimiento.dni != '' 
                                  ? movimiento.dni!
                                  :'', 
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
      
                              const SizedBox(height:10),
      
                              Text(
                                movimiento.cargo != '' 
                                  ? movimiento.cargo!.split(' ')
                                    .map((cargo) {
                                      if (cargo == '') return null;
                                      return cargo[0] + cargo.substring(1).toLowerCase();
                                    })
                                    .join(' ')
                                  :'', 
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
      
                              const SizedBox(height:10),
                              Text(
                                movimiento.empresa != '' 
                                  ? movimiento.empresa!.split(' ')
                                    .map((empresa) {
                                      if (empresa == '') return null;
                                      return empresa[0] + empresa.substring(1).toLowerCase();
                                    })
                                    .join(' ')
                                  :'', 
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
      
                            ],
                          ),
                        ),
                      ),
                    ),
                    //BODY ES DINAMICO
                    SelectedWidgetBody(movimiento: movimiento,datosSalida: datosSalida!),
                  ],
                ),
              ),

              Positioned(
                top: 0,
                left: 10,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 30),
                  onPressed: ()=>Navigator.pop(context), 
                ),
              ),

              // if(movimiento.fechaSalida == '')
              //   Positioned(
              //     top: 0,
              //     right: 10,
              //     child: IconButton(
              //       icon: const FaIcon(FontAwesomeIcons.personWalkingDashedLineArrowRight, color: Colors.white, size: 30),
              //       onPressed: ()=>Navigator.pop(context), 
              //     ),
              //   ),

              Positioned(
                top: size.height*0.42,
                left: (movimiento.codDatoAcceso!=0 || datosSalida.codigoDatosAcceso != "0" ) ? size.width* 0.15 : size.width* 0.35,
                child: Row(
                  children: [
                    const CustomButton(textButton: 'Movimiento'),
                    if(movimiento.codDatoAcceso!=0 || datosSalida.codigoDatosAcceso !="0")
                      SizedBox(width: size.width*.1),
                    if(movimiento.codDatoAcceso!=0 || datosSalida.codigoDatosAcceso !="0")
                      const CustomButton(textButton: 'Acceso'),
                  ],
                ),
              ),

            ],
          ),
        );
      },
    );
  }
}

class SelectedWidgetBody extends StatelessWidget {

  final MovimientoModel movimiento;
  final DatosAccesoSalidaModel datosSalida;

  const SelectedWidgetBody({
    Key? key, 
    required this.movimiento,
    required this.datosSalida,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final detailmovProvider = Provider.of<DetalleMovimientoProvider>(context);
    final currentIndex = detailmovProvider.indexCurrent; 

    switch (currentIndex) {

      case 1:
        return MovimientoDataBody(movimiento: movimiento);

      case 2:
        return MovimientoDatoAccesoBody(movimiento: movimiento, datosSalida: datosSalida);

      default:
        return MovimientoDataBody(movimiento: movimiento);

    }

  }
}
