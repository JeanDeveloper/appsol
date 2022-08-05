import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solgis/home/domain/providers/global_provider.dart';
import 'package:solgis/people/data/services/consulta_datos_persona_service.dart';
import 'package:solgis/people/domain/helpers/get_image.dart';
import 'package:solgis/people/domain/models/consulta_persona_model.dart';
import 'package:solgis/people/domain/models/consulta_validacion_model.dart';
import 'package:solgis/people/presentation/widgets/widgets.dart';
import 'package:solgis/theme/style_people.dart';


class ConsultaPage extends StatelessWidget {
  const ConsultaPage({Key? key}) : super(key: key);

  @override

  Widget build(BuildContext context){
  
  final consulta = ModalRoute.of(context)!.settings.arguments as ConsultaModel;


  return Scaffold(

      appBar: AppBar(

        leading: IconButton(
          onPressed: ()=>Navigator.of(context).pop(), 
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white,)
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff1E2971),
        title: const Text('CONSULTA', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold))
      ),

      body: _ConsultaPageBody(consulta: consulta),

  );
  }
}

class _ConsultaPageBody extends StatelessWidget {

  final ConsultaModel consulta;

  const _ConsultaPageBody({
    Key? key, 
    required this.consulta
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final loginProvider = Provider.of<GlobalProvider>(context);

    final size = MediaQuery.of(context).size;

    ConsultaDatosService consultadatosservice = ConsultaDatosService();

    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),

      child: Column(
        
        children: [

          // FOTO
          FutureBuilder(

            future: getImage(consulta.img),

            builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {

              if(snapshot.hasData){

                return Container(
                  
                  width: size.width*0.33,
                  height: size.width*0.33,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: snapshot.data,
                
                );

              }else{
                return const CircularProgressIndicator();
              }
            }

          ),

          //ESTADO
          FutureBuilder(

            future: consultadatosservice.getConsulta(consulta.codigoServicio.toString(), consulta.codigoPersona.toString(), consulta.tipoPersona![0]),
            
            builder:  ( BuildContext context , AsyncSnapshot<ConsultaDatosPersonaModel>snapshot ){

              if(!snapshot.hasData) return Container(width: 40, height: 40, child:  const Center(child: CircularProgressIndicator()));

              if( snapshot.data!.valor == '0'){

                if(loginProvider.codCliente == '25866') return _ContainerEstado(size:size, text: 'HOMOLOGADO', color: Colors.greenAccent,);
                
                if( loginProvider.codCliente == '00013') return _ContainerEstado(size:size, text: 'INDUCIDO', color: Colors.greenAccent); //CODIGO EXALMAR 
                
                return _ContainerEstado(size:size, text: 'VIGENTE', color: Colors.greenAccent,);

              } 
              
              if(snapshot.data!.valor == '-1')return _ContainerEstado(size:size, text: 'NO TIENE', color: Colors.orange,);
              

              return _ContainerEstado(size:size, text: 'VENCIDO', color: Colors.red,);

            }

          ),
          
          SizedBox(height: size.height*0.02),

          //CAMPO DNI
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('DNI:', style: styleCrearPersonaltextForm()),
              
              InputReadOnlyWidget(initialValue: consulta.docPersona),


            ]
          ),
          SizedBox(height: size.height*0.02), 

          //CAMPO NOMBRES
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('NOMBRES:  ', style: styleCrearPersonaltextForm()),
              InputReadOnlyWidget(initialValue: consulta.nombresPersona),

            ]
          ),
          SizedBox(height: size.height*0.02), 

          //CAMPO CARGO
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('CARGO:  ', style: styleCrearPersonaltextForm()),
              InputReadOnlyWidget(initialValue: consulta.cargo),

            ]
          ),
          SizedBox(height: size.height*0.02), 

          //CAMPO EMPRESA
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('EMPRESA:  ', style: styleCrearPersonaltextForm()),

              InputReadOnlyWidget(initialValue: consulta.empresa),

            ]
          ),
          SizedBox(height: size.height*0.02), 

          //CAMPO AUTORIZANTE
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
  
            children: [
  
              Text('AUTORIZANTE:  ', style: styleCrearPersonaltextForm()),
              InputReadOnlyWidget(initialValue: consulta.autorizante ),

            ],
          ),

          SizedBox(height: size.height*0.02), 

          //CAMPO MOTIVO
          Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [

              Text('MOTIVO:  ', style: styleCrearPersonaltextForm()),
              InputReadOnlyWidget(initialValue: consulta.motivo),

            ],

          ),
          SizedBox(height: size.height*0.02), 

          //CAMPO ACCESO
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
  
            children: [
  
              Text('AREA DE ACCESSO:  ', style: styleCrearPersonaltextForm().copyWith(fontSize: 13)),
              InputReadOnlyWidget(initialValue: consulta.area),
            ],

          ),
          
          SizedBox(height: size.height*0.02), 

          //FECHA DE AUTORIZACION 
          Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,
  
            children: [
  
              Text('F.  AUTORIZACION:', style: styleCrearPersonaltextForm().copyWith(fontSize: 13)),

              FutureBuilder(

                future: consultadatosservice.getConsulta(consulta.codigoServicio.toString(), consulta.codigoPersona.toString(), consulta.tipoPersona![0]),
                
                builder:  ( BuildContext context , AsyncSnapshot<ConsultaDatosPersonaModel>snapshot ){


                  // if(!snapshot.hasData) return Expanded(child: Center(child: Container(width: size.width*0.05, height: size.width*0.05, child:  const CircularProgressIndicator())));
                  if(!snapshot.hasData) return Expanded(child:Container());
                  if( snapshot.data!.fiAutorizacion == '0') return const InputReadOnlyWidget(initialValue: 'NO CUENTA CON AUTORIZACION');

                  return InputReadOnlyWidget(initialValue: snapshot.data!.fiAutorizacion);

                }
              
              ),

            ],
          ),

          SizedBox(height: size.height*0.03), 

          //CAMPO STCR PENSION
          Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,
  
            children: [
  
              Text('SCTR PENSION:  ', style: styleCrearPersonaltextForm().copyWith(fontSize: 13)),


              FutureBuilder(

                future: consultadatosservice.getConsulta(consulta.codigoServicio.toString(), consulta.codigoPersona.toString(), consulta.tipoPersona![0]),
                
                builder:  ( BuildContext context , AsyncSnapshot<ConsultaDatosPersonaModel>snapshot ){

                  // if(!snapshot.hasData) return Expanded(child: Center(child: Container(width: size.width*0.05, height: size.width*0.05, child:  const CircularProgressIndicator())));
                  if(!snapshot.hasData) return Expanded(child:Container());
                  if( snapshot.data!.sctrSaludFv == '0') return const InputReadOnlyWidget(initialValue: 'NO CUENTA CON SCTR SALUD');

                  return InputReadOnlyWidget(initialValue: snapshot.data!.sctrSaludFv);

                }
              
              ),

              
            ],

          ),
          

          SizedBox(height: size.height*0.03), 

          //CAMPO STCR SALUD
          Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,
  
            children: [
  
              Text('SCTR SALUD:  ', style: styleCrearPersonaltextForm().copyWith(fontSize: 13)),


              FutureBuilder(

                future: consultadatosservice.getConsulta(consulta.codigoServicio.toString(), consulta.codigoPersona.toString(), consulta.tipoPersona![0]),
                
                builder:  ( BuildContext context , AsyncSnapshot<ConsultaDatosPersonaModel>snapshot ){

                  // if(!snapshot.hasData) return Expanded(child: Center(child: Container(width: size.width*0.05, height: size.width*0.05, child:  const CircularProgressIndicator())));
                  if(!snapshot.hasData) return Expanded(child:Container());

                  if( snapshot.data!.sctrPensionFv == '0') return const InputReadOnlyWidget(initialValue: 'NO CUENTA CON SCTR PENSION');

                  return InputReadOnlyWidget(initialValue: snapshot.data!.sctrPensionFv);

                }
              
              ),

              

            ],

          ),


          SizedBox(height: size.height*0.03), 

          //CAMPO EMO
          Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,
  
            children: [
  
              Text('EMO:  ', style: styleCrearPersonaltextForm().copyWith(fontSize: 13)),

              FutureBuilder(

                future: consultadatosservice.getConsulta(consulta.codigoServicio.toString(), consulta.codigoPersona.toString(), consulta.tipoPersona![0]),
                
                builder:  ( BuildContext context , AsyncSnapshot<ConsultaDatosPersonaModel>snapshot ){

                  // if(!snapshot.hasData) return Expanded(child: Center(child: Container(width: size.width*0.05, height: size.width*0.05, child:  const CircularProgressIndicator())));

                  if(!snapshot.hasData) return Expanded(child:Container());

                  if( snapshot.data!.emoFv == '0') return const InputReadOnlyWidget(initialValue: 'NO CUENTA CON E.M.O');

                  return InputReadOnlyWidget(initialValue: snapshot.data!.emoFv);

                }
              ),

            ],

          ),

        ],

      ),

    );

  }


}

class _ContainerEstado extends StatelessWidget {
  const _ContainerEstado({
    Key? key,
    required this.size, 
    required this.text, 
    required this.color,
  }) : super(key: key);

  final Size size;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {

    return Container(

      height: size.height*0.03,
      width: size.width*0.3,

      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(50)

      ),

      alignment: Alignment.center,
      child: Text(text, style: const TextStyle(color: Colors.white)),

    );

  }

}

